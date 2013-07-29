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

    clientSession.puts "method=>#{_method}, key=>#{_key}, value=>#{_value}"
    
      while !(clientSession.closed?) && (serverMessage = clientSession.gets)
        clientSession.close if serverMessage.include?("Goodbye") # Close clientSession if receved Goodbye from server
        ## lets output our server messages
        puts serverMessage unless clientSession.closed?
      end #end loop
  end
end
