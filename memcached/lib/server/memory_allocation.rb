require "objspace"
class CachedMemory
$mcatch = {}

  def set(max_size, key, value)
  begin
    bite_size = ObjectSpace.memsize_of($mcatch)
    if bite_size < max_size
      $mcatch[key.to_sym] = value
    else
      puts "Memory limit reached."
    end
  rescue Exception => e
    puts e
    puts "Raised above error please fix above"
  end
  	
  end

  def get(key)
  	$mcatch[key.to_sym]
  end

  def flush
  	$mcatch = {}
  end

  def other(_method)
  	puts "#{_method} not found. Please use either get, set or flush methods"
  end
end