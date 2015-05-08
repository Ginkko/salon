require "spec_helper"

describe(Stylist) do

  describe('#save') do
    it('adds the stylist to the list of stylists') do
      test_stylist = Stylist.new({:name => "Tiberius", :id => nil})
      test_stylist.save
      expect(Stylist.all).to eq([test_stylist])
    end
  end

  describe('.find') do
    it('returns a stylist with given id') do
      stylist1 = Stylist.new({:name => "Tiberius", :id => nil})
      stylist2 = Stylist.new({:name => "Leonard", :id => nil})
      stylist1.save
      stylist2.save
      expect(Stylist.find(stylist2.id)).to eq(stylist2)
    end
  end

  describe('#client_add') do
    it('assigns a client to a stylist') do
      test_stylist = Stylist.new({:name => "Tiberius", :id => nil})
      test_client = Client.new({:name => "Khan", :id => nil, :stylist_id => nil})
      test_stylist.save
      test_client.save
      test_stylist.client_add(test_client.id)
      expect(Client.find(test_client.id).stylist_id.to_i).to eq(test_stylist.id)
    end
  end

  describe('#clients') do
    it('returns a list of clients associated with the stylist') do
      test_stylist = Stylist.new({:name => 'Tiberius', :id => nil})
      test_stylist.save
      test_client = Client.new({:name => 'Khan', :id => nil, :stylist_id => test_stylist.id})
      test_client.save
      expect(test_stylist.clients).to eq([test_client])
    end
  end

end
