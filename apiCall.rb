require 'uri'
require 'net/http'

userId = "georgii.marinov98@gmail.com"
token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6IjZJOVlfSlBxVDk2NkliUUJMM1otdVEiLCJleHAiOjE1ODk4MTA3NTQsImlhdCI6MTU4OTgwNTM1NX0.a7JPQnF3Uka4NKqMieSATPVQ6YfDvsXeeRaMYL0FkQE"

url = URI("https://api.zoom.us/v2/users/#{userId}/recordings")


http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["authorization"] = "Bearer #{token}"
request["content-type"] = "application/json"

response = http.request(request)
puts response.read_body

