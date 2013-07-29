require 'zlib'
module ConsistentHashr

  @circle_clock = {}
  @number_of_dots_per_server = 10
  
  ##
  # Computes a key
  def self.hash_key(key)
    Zlib.crc32("#{key}")
  end

  ##
  # Adds a server to the circle_clock
  def self.add_server(_name, _server)
    @number_of_dots_per_server.times do |t|
      @circle_clock[hash_key("#{_name}+#{t}")] = _server
    end
  end
  
  ##
  # Returns the server for the provided key
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

  def self.all_servers
    @circle_clock.invert.map{|k,v| k}
  end
  
end