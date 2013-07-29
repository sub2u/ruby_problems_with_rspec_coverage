require File.dirname(__FILE__) + "/consistent_hash"
require File.dirname(__FILE__) + "/client"

class MemcachClient

  def initialize(mem_servers = {})
    p mem_servers
    mem_servers.each do |node, location|
      ConsistentHash.add_server(node, location)
      puts "Added #{location} memcached server to list.."
    end
  end

  def self.add_server(node, location)
    ConsistentHash.add_server(node, location)
    puts "Added #{location} memcached server to list.."
  end

  def get(key)
    mm_client = processconsisten_hash(key)
    mm_client.process_connection('get', key)
  end

  def set(key, value)
    mm_client = processconsisten_hash(key)
    mm_client.process_connection('set', key, "#{value}")
  end

  def flush
    mem_server = ConsistentHash.all_servers
    mem_server.each do |server|
      mm_client = TcpClient.new(server)
      mm_client.process_connection('flush')
    end

  end

private 

  def processconsisten_hash(key = nil)
    mem_server = ConsistentHash.get(key)
    mm_client = TcpClient.new(mem_server)
  end

end