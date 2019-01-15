require 'uri'
require 'net/http'

class ExampleController < ActionController::Base

  def curl_data
    render plain: "payload: #{request.body.read}"
  end

  def curl_send
    url = URI("https://echo.apps.verygood.systems/post")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true if url.scheme == 'https'   

    new_request = Net::HTTP::Post.new(url, initheader = {'Content-Type' =>'application/json'})
    new_request["cache-control"] = 'no-cache'
    new_request["Postman-Token"] = '2bc99c28-a586-41c7-86d0-5d3c427e5d39'
    new_request.body = "#{request.body.read}"

    response = http.request(new_request)
    render plain: "#{response.read_body}"
  end
end