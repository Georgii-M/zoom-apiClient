require 'uri'
require 'net/http'

puts "Provide your username below(eg.example@mail.com): "
userId = gets.chomp
puts "Provide your access token below: "
token = gets.chomp


url = URI("https://api.zoom.us/v2/users/#{userId}/recordings")


http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["authorization"] = "Bearer #{token}"
request["content-type"] = "application/json"

response = http.request(request)
puts response.read_body

