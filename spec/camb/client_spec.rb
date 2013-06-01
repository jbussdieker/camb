require 'camb_worker'

describe CambWorker::Client do
  before do
    @client = CambWorker::Client.new
  end

  it { @client.client.should be_kind_of(Net::HTTP) }
  it { @client.request.should be_kind_of(Net::HTTP::Get) }
  it { @client.response.should be_kind_of(Net::HTTPResponse) }
end
