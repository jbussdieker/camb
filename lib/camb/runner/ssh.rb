require 'net/ssh'

module Camb
  module Runner
    class SSH
      def initialize(options = {})
        @host = options[:probe][:host] || "localhost"
        @user = options[:probe][:user]
        @options = options[:test]
      end

      def ssh
        @ssh ||= Net::SSH.start(@host, @user)
      end

      def run
        params = @options.collect {|k,v| "--#{k} #{v}"}.join(" ")
        results = ""
        ssh.exec!("camb_runner #{params}") do |channel, stream, data|
          results << data
        end
        results
      end
    end
  end
end
