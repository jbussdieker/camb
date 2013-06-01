require 'net/http'

module Camb
  class Runner
    def initialize(options = {})
      @options = options
    end

    def client
      @client ||= Client.new(@options)
    end

    def run
      start = Time.now
      response = client.response
      {
        :total => Time.new - start,
        :code => response.code
      }
    end
  end
end
