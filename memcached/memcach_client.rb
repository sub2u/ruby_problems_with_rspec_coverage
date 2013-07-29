require File.dirname(__FILE__) + "/lib/client/memcach_client"

# Methods allowed for class MemcachClient are
# 
# MemcachClient.remove_server("localhost:5001")
# MemcachClient.all_servers
# MemcachClient.all_servers_with_dots
# 
# MemcachClient.new.set('key', value)
# MemcachClient.new.get('key')
# MemcachClient.new.flush


memcatch = MemcachClient.new({"s1" => "localhost:5000", "s2" => "localhost:5001", "s3" => "localhost:5002"})


1000.times do |i|
  memcatch.set("first_key#{i}", "I am good to know that every one are gooo\d to me and i am happy first. --- #{i}")
  p memcatch.get("first_key#{i}")
  memcatch.set("second_key#{i}", "I am good to know that every one are gooo\d to me and i am happy seconnd. --- #{i}")
  p memcatch.get("second_key#{i}")
end

memcatch.flush

MemcachClient.remove_server("localhost:5001")
p MemcachClient.all_servers
p MemcachClient.all_servers_with_dots

10.times do |i|
  memcatch.set("first_key#{i}", "I am good to know that every one are gooo\d to me and i am happy first. --- #{i}")
  p memcatch.get("first_key#{i}")
  memcatch.set("second_key#{i}", "I am good to know that every one are gooo\d to me and i am happy seconnd. --- #{i}")
  p memcatch.get("second_key#{i}")
end