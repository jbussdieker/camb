require 'net/http'

module Camb
  class Client
    def initialize(options = {})
      @host = options[:host] || "localhost"
      @port = options[:port] || 80
      @url = options[:url] || "/"
    end

    def client
      @client ||= Net::HTTP.new(@host, @port)
    end

    def request
      @request ||= Net::HTTP::Get.new(@url)
    end

    def response
      client.request(request)
    end
  end
end
