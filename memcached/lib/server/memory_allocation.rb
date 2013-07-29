require "objspace"

class CachedMemory

  $mcatch = {}

  def set(max_size, key, value)
    begin
      bite_size = ObjectSpace.memsize_of($mcatch)
      if bite_size < max_size
        $mcatch[key] = value
      else
        puts "Memory limit reached."
      end
    rescue Exception => e
      puts e
      puts "Raised above error please fix to continue..."
    end
  end

  def get(key)
    return "MISS : Value for #{key.to_s} not found in this mamcached server" unless $mcatch.has_key?(key)
    $mcatch[key]
  end

  def flush
    $mcatch = {}
  end

  def other(_method)
    puts "#{_method} not found. Please use either get, set or flush methods"
  end
end