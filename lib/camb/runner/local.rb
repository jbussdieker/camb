require 'net/http'

module Camb
  module Runner
    class Local
      def initialize(options = {})
        @options = options
      end

      def client
        @client ||= Camb::Client.new(@options)
      end

      def run
        start = Time.now
        response = client.response
        {
          :timestamp => (start.to_f * 1000).to_i,
          :total_time => Time.new - start
        }.to_json
      end
    end
  end
end
