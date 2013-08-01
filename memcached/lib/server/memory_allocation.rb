require "objspace"

class CachedMemory

  $mcatch = {}

  def set(max_size, log = nil, key, value)
    begin
      bite_size = ObjectSpace.memsize_of($mcatch)
      if max_size == -1 || bite_size < max_size
        puts "Added chunk of size #{ObjectSpace.memsize_of({key => value})} to server" unless log.nil?
        $mcatch[key] = value
      else
        puts "Memory limit reached."
      end
    rescue Exception => e
      puts "Raised The error '#{e.inspect}'please fix to continue..."
    end
  end

  def get(log = nil, key)
    return "MISS : Value for #{key.to_s} not found in this mamcached server" unless $mcatch.has_key?(key)
    puts "Hit on server for key #{key} on server" unless log.nil?
    $mcatch[key]
  end

  def flush(log = nil)
    puts "Flushed the #{ObjectSpace.memsize_of($mcatch)} bites of server data" unless log.nil?
    $mcatch = {}
  end

  def other(_method)
    puts "#{_method} not found. Please use either get, set or flush methods"
  end
end