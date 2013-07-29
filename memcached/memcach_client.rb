require File.dirname(__FILE__) + "/lib/client/memcach_client"

memcatch = MemcachClient.new({"s1" => "localhost:5000", "s2" => "localhost:5001", "s3" => "localhost:5002"})
1000.times do |i|
memcatch.set("first_key#{i}", "I am good to know that every one are gooo\d to me and i am happy first. --- #{i}")
p memcatch.get("first_key#{i}")
memcatch.set("second_key#{i}", "I am good to know that every one are gooo\d to me and i am happy seconnd. --- #{i}")
p memcatch.get("second_key#{i}")
end
 p memcatch.flush
 10.times do |i|
memcatch.set("first_key#{i}", "I am good to know that every one are gooo\d to me and i am happy first. --- #{i}")
p memcatch.get("first_key#{i}")
memcatch.set("second_key#{i}", "I am good to know that every one are gooo\d to me and i am happy seconnd. --- #{i}")
p memcatch.get("second_key#{i}")
end