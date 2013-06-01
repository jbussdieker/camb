require 'camb_worker'

describe CambWorker::Runner do
  before do
    @runner = CambWorker::Runner.new
  end

  it { @runner.client.should be_kind_of(CambWorker::Client) }
end
