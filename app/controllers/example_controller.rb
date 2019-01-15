require 'uri'
require 'net/http'
require 'net/https'
require 'json'


class ExampleController < ActionController::Base

  def curl_data
    render plain: "#{request.body.read}"
  end

  def curl_send
    proxy = URI.parse("https://US9vdvFuXLsqb3NvCv7BDw1d:2f3a15f9-6caa-43f2-8b89-67ede8421759@tnt5jvcsgxf.sandbox.verygoodproxy.com:8080")
    uri = URI.parse('https://echo.apps.verygood.systems/post')
    http = Net::HTTP.new(uri.host, uri.port, proxy.host, proxy.port, proxy.user, proxy.password)
    http.use_ssl = true
    http.ca_file = "-----BEGIN CERTIFICATE-----
    MIID2TCCAsGgAwIBAgIHAN4Gs/LGhzANBgkqhkiG9w0BAQ0FADB5MSQwIgYDVQQD
    DBsqLnNhbmRib3gudmVyeWdvb2Rwcm94eS5jb20xITAfBgNVBAoMGFZlcnkgR29v
    ZCBTZWN1cml0eSwgSW5jLjEuMCwGA1UECwwlVmVyeSBHb29kIFNlY3VyaXR5IC0g
    RW5naW5lZXJpbmcgVGVhbTAgFw0xNjAyMDkyMzUzMzZaGA8yMTE3MDExNTIzNTMz
    NloweTEkMCIGA1UEAwwbKi5zYW5kYm94LnZlcnlnb29kcHJveHkuY29tMSEwHwYD
    VQQKDBhWZXJ5IEdvb2QgU2VjdXJpdHksIEluYy4xLjAsBgNVBAsMJVZlcnkgR29v
    ZCBTZWN1cml0eSAtIEVuZ2luZWVyaW5nIFRlYW0wggEiMA0GCSqGSIb3DQEBAQUA
    A4IBDwAwggEKAoIBAQDI3ukHpxIlDCvFjpqn4gAkrQVdWll/uI0Kv3wirwZ3Qrpg
    BVeXjInJ+rV9r0ouBIoY8IgRLak5Hy/tSeV6nAVHv0t41B7VyoeTAsZYSWU11deR
    DBSBXHWH9zKEvXkkPdy9tgHnvLIzui2H59OPljV7z3sCLguRIvIIw8djaV9z7FRm
    KRsfmYHKOBlSO4TlpfXQg7jQ5ds65q8FFGvTB5qAgLXS8W8pvdk8jccmuzQXFUY+
    ZtHgjThg7BHWWUn+7m6hQ6iHHCj34Qu69F8nLamd+KJ//14lukdyKs3AMrYsFaby
    k+UGemM/s2q3B+39B6YKaHao0SRzSJC7qDwbWPy3AgMBAAGjZDBiMB0GA1UdDgQW
    BBRWlIRrE2p2P018VTzTb6BaeOFhAzAPBgNVHRMBAf8EBTADAQH/MAsGA1UdDwQE
    AwIBtjAjBgNVHSUEHDAaBggrBgEFBQcDAQYIKwYBBQUHAwIGBFUdJQAwDQYJKoZI
    hvcNAQENBQADggEBAGWxLFlr0b9lWkOLcZtR9IDVxDL9z+UPFEk70D3NPaqXkoE/
    TNNUkXgS6+VBA2G8nigq2Yj8qoIM+kTXPb8TzWv+lrcLm+i+4AShKVknpB15cC1C
    /NJfyYGRW66s/w7HNS20RmrdN+bWS0PA4CVLXdGzUJn0PCsfsS+6Acn7RPAE+0A8
    WB7JzXWi8x9mOJwiOhodp4j41mv+5eHM0reMh6ycuYbjquDNpiNnsLztk6MGsgAP
    5C59drQWJU47738BcfbByuSTYFog6zNYCm7ACqbtiwvFTwjneNebOhsOlaEAHjup
    d4QBqYVs7pzkhNNp9oUvv4wGf/KJcw5B9E6Tpfk=
    -----END CERTIFICATE-----"
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    http.verify_depth = 5

    new_request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
    new_request.body = "#{request.body.read}".to_json
    response = http.request(new_request)
    render plain: "Response #{response.code} #{response.message}: #{response.body}"
  end
end