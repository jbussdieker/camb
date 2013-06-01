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
        :timestamp => (start.to_f * 1000).to_i,
        :total_time => Time.new - start
      }
    end
  end
end
