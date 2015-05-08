require "spec_helper"

describe(Client) do

  describe ('#save') do
    it('adds the client to the list of clients') do
      test_client = Client.new({:name => "Khan", :id => nil, :stylist_id => 1})
      test_client.save
      expect(Client.all).to eq([test_client])
    end
  end

  describe ('.find') do
    it('returns a client with given id') do
      client1 = Client.new({:name => "Khan", :id => nil, :stylist_id => 1})
      client2 = Client.new({:name => "Soran", :id => nil, :stylist_id => 1})
      client1.save
      client2.save
      expect(Client.find(client2.id)).to eq(client2)
    end
  end

end
