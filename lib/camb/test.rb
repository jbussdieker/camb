require 'eventmachine'

module Camb
  class Test
    def initialize(options = {})
      @interval = options[:interval] || 1
      @count = options[:count] || 1
      @name = options[:name] || "test1"
      @options = options
      @metrics = []
    end

    def runner
      @runner ||= Runner.new(@options)
    end

    def add_metric(data)
      @metrics << data

      # Flush metrics every 2 seconds
      if Time.now.to_f - @metrics.first[:time] > 2.0
        @metrics = []
      end
    end

    def start
      EM.run do
        EventMachine::PeriodicTimer.new(@interval) do
          start = Time.now.to_f
          data = runner.run
          data.merge!({:time => start})
          add_metric(data)
        end
      end
    end
  end
end
