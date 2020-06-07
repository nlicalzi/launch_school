require "socket"

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line
  
  client.puts "HTTP/1.1 200 OK"                   # needed for rendering in Chrome
  client.puts "Content-Type: text/plain\r\n\r\n"  # needed for rendering in Chrome
  client.puts request_line
  client.close
end