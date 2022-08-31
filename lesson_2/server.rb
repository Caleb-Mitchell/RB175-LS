require 'socket'

def parse_reqest(request_line)
  http_method, path_and_params, http = request_line.split(' ')
  path, params = path_and_params.split('?')

  params = params.split('&').each_with_object({}) do |pair, hash|
    key, value = pair.split('=')
    hash[key] = value
  end

  [http_method, path, params]
end

server = TCPServer.new('localhost', 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  puts request_line

  http_method, path, params = parse_reqest(request_line)

  client.puts request_line
  client.puts http_method
  client.puts path
  client.puts params

  rolls = params['rolls'].to_i
  sides = params['sides'].to_i

  rolls.times { client.puts rand(sides) + 1 }

  client.close
end
