require File.dirname(__FILE__) + "/lib/client/memcach_client"

memcatch = MemcachClient.new({"s1" => "localhost:5000", "s2" => "localhost:5001", "s3" => "localhost:5002"})
puts "setting first key "
memcatch.set('first_key', "I am good to know that every one are gooo\d to me and i am happy first.")
puts "getting first key "
p memcatch.get('first_key')
puts "setting second key "
memcatch.set('second_key', "I am good to know that every one are gooo\d to me and i am happy seconnd.")
puts "getting second key "
p memcatch.get('second_key')