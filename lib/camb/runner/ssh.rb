require 'net/ssh'

module Camb
  module Runner
    class SSH
      def initialize(options = {})
        @host = options[:probe][:host] || "localhost"
        @user = options[:probe][:user]
        @options = options[:test]
      end

      def run
        params = @options.collect {|k,v| "--#{k} #{v}"}.join
        Net::SSH.start(@host, @user) do |ssh|
          ssh.exec!("camb_runner #{params}") do |channel, stream, data|
            return data
          end
        end
      end
    end
  end
end
