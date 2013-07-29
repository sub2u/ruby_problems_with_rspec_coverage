class Memory
$mcatch = {}
  def set(key, value)
  $mcatch[key] = value
   end
  def get(key)
  $mcatch[key]
   end
  def flush
  $mcatch = {}
   end
end