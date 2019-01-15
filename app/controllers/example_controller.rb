require 'uri'
require 'net/http'
require 'net/https'
require 'json'
require 'openssl'

class ExampleController < ActionController::Base

  def curl_data
    render plain: "#{request.body.read}"
  end

  def curl_send
    proxy = URI.parse("https://US9vdvFuXLsqb3NvCv7BDw1d:2f3a15f9-6caa-43f2-8b89-67ede8421759@tnt5jvcsgxf.sandbox.verygoodproxy.com:8080")
    uri = URI.parse('https://echo.apps.verygood.systems/post')
    http = Net::HTTP.new(uri.host, uri.port, proxy.host, proxy.port, proxy.user, proxy.password)
    http.use_ssl = true
    http.ca_file = File.join(Rails.root, 'cert.pem')
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.verify_depth = 5

    new_request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
    new_request.body = "#{request.body}".to_json
    response = http.request(new_request)
    render plain: "Response #{response.code} #{response.message}: #{response.body}"
  end
end