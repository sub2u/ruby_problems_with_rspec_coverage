#!/usr/bin/ruby
require 'socket'
class TcpClient
	attr_reader :host, :port

	 def initialize(_host)
	 	@host = _host.split(':')[0]
	 	@port = _host.split(':')[1]
	 end

	def process_connection(_method, _key = nil, _value = nil)
clientSession = TCPSocket.new( host, port )
puts "log: starting connection"
#send a quick message
## Note that this has a carriage return. Remember our server
## uses the method gets() to get input back from the server.
puts "log: saying hello"

clientSession.puts "method=>#{_method}, key=>#{_key}, value=>#{_value}"
#wait for messages from the server
## You've sent your message, now we need to make sure
## the session isn't closed, spit out any messages the server
## has to say, and check to see if any of those messages
## contain 'Goodbye'. If they do we can close the connection
 while !(clientSession.closed?) &&
          (serverMessage = clientSession.gets)
  ## lets output our server messages
  puts serverMessage
  #if one of the messages contains 'Goodbye' we'll disconnect
  ## we disconnect by 'closing' the session.
  if serverMessage.include?("Goodbye")
   puts "log: closing connection"
   clientSession.close
  end
 end #end loop
end
end
