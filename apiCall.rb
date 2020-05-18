require 'uri'
require 'net/http'

# Place your userID (eg.email) and token below
userId = "example@mail.com"
token = "Your JWT access token"

url = URI("https://api.zoom.us/v2/users/#{userId}/recordings")


http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["authorization"] = "Bearer #{token}"
request["content-type"] = "application/json"

response = http.request(request)
puts response.read_body

