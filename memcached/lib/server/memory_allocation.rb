class CachedMemory
$mcatch = {}

  def set(key, value)
  	$mcatch[key] = value
  	nil
  end

  def get(key)
  	p $mcatch
  	$mcatch[key]
  end

  def flush
  	$mcatch = {}
  end

  def other(_method)
  	puts "#{_method} not found. Please use either get, set or flush methods"
  end
end