require 'zlib'
module ConsistentHash

  @circle_clock = {}

  # Please increase number of dots if you require more eficient.
  @number_of_dots_per_server = 10

  def self.all_servers
    @circle_clock.invert.map{|k,v| k}
  end

  def self.hash_key(key)
    Zlib.crc32("#{key}")
  end

  def self.remove_server(_server)
    @circle_clock.each do |k, v|
      @circle_clock.delete(k) if v == _server
    end
  end

  def self.add_server(_name, _server)
    @number_of_dots_per_server.times do |t|
      @circle_clock[hash_key("#{_name}+#{t}")] = _server
    end
  end
  def self.all_servers_with_dots
    @circle_clock
  end

  def self.get(key)
    return nil if @circle_clock.empty?
    return @circle_clock.first.last if @circle_clock.size == 1
    
    hash = hash_key(key)
    
    # If the key is there, let's return it.
    return @circle_clock[hash] if @circle_clock[hash]
    
    # If not, we need to find the next closest from it!
    hash = @circle_clock.keys.select() { |k| k > hash }.sort.first
    
    return @circle_clock.first.last if hash.nil?
    return @circle_clock[hash]
  end

end
