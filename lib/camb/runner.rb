require 'camb/runner/local'
require 'camb/runner/ssh'

module Camb
  module Runner
    def self.new(options)
      if options[:probe][:host]
        Camb::Runner::SSH.new(options)
      else
        Camb::Runner::Local.new(options[:test])
      end
    end
  end
end
