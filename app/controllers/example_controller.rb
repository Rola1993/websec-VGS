require 'uri'
require 'net/http'
require 'net/https'
require 'json'

class ExampleController < ActionController::Base

  def curl_data
    render plain: "payload: #{request.body.read}"
  end

  def curl_send
  proxy = URI.parse('https://<USERNAME>:<PASSWORD>@tnt5jvcsgxf.sandbox.verygoodproxy.com:8080')
  uri = URI.parse('https://echo.apps.verygood.systems/post')
  http = Net::HTTP.new(uri.host, uri.port, proxy.host, proxy.port, proxy.user, proxy.password)
  http.use_ssl = true
  http.ca_file = '../../cert.pem'
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  http.verify_depth = 5

  request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
  request.body = {secret: 'ALIAS'}.to_json
  response = http.request(request)
  render plain: "Response #{response.code} #{response.message}: #{response.body}"
  end
end