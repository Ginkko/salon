require "spec_helper"

describe(Stylist) do

  describe('#save') do
    it('adds the stylist to the list of stylists') do
      test_stylist = Stylist.new({:name => "Tiberius", :id => nil})
      test_stylist.save
      expect(Stylist.all).to eq([test_stylist])
    end
  end

end
