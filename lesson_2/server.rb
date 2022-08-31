require 'socket'

server = TCPServer.new('localhost', 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  puts request_line

  client.puts request_line

  ###
  url_segments = request_line.split

  # parse HTTP method
  http_method = url_segments.first
  # parse path
  path = request_line.split[1].split('?').first

  # parse params
  param_string = request_line.split[1].split('?')[1].split('&')
  params = {}
  param_string.each do |pair|
    new_pair = pair.split('=')
    params[new_pair[0]] = new_pair[1]
  end

  client.puts params

  params['rolls'].to_i.times { client.puts rand(params['sides'].to_i) + 1 }

  client.close
end
