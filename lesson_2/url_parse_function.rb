def parse_params(url)

  url_segments = url.split

  http_method = url_segments.first
  puts http_method

  path = url.split[1].split('?').first
  puts path

  param_string = url.split[1].split('?')[1].split('&')
  params = {}
  param_string.each do |pair|
    new_pair = pair.split('=')
    params[new_pair[0]] = new_pair[1]
  end
  puts params
end


parse_params("GET /?rolls=2&sides=6 HTTP/1.1")


