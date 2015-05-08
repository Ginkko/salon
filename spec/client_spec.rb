require "spec_helper"

describe(Client) do

  describe ('#save') do
    it('adds the client to the list of clients') do
      test_client = Client.new({:name => "Khan", :id => nil})
      test_client.save
      expect(Client.all).to eq([test_client])
    end
  end

end
