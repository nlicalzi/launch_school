require "socket"

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method = request_line.split.first

  path, query_parameters = request_line.split[1].split("?")

  params = {}
  query_parameters.split("&")\
                  .map { |param| param.split("=")}\
                  .each { |k, v| params[k] = v }
  
  client.puts "HTTP/1.1 200 OK"                   # needed for rendering in Chrome
  client.puts "Content-Type: text/plain\r\n\r\n"  # needed for rendering in Chrome

  params["rolls"].to_i.times { |_| client.puts rand(params["sides"].to_i) + 1 }

  client.close
end