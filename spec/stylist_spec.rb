require("spec_helper")

describe(Stylist) do

  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#clients") do
    it("returns an array of all clients for that stylist") do
      stylist1 = Stylist.new({:name => "Grand Master Comb", :id => 1})
      client1 = Client.new({:name => "Dwayne The Rock Johnson", :stylist_id => 1})
      client1.save()
      client2 = Client.new({:name => "Markie Mark Wahlberg", :stylist_id => 1})
      client2.save()
      expect(stylist1.clients()).to(eq([client1, client2]))
    end
  end

  describe("#save") do
    it("saves a stylist to the database") do
      stylist1 = Stylist.new({:name => "Grand Master Comb", :id => nil})
      expect(stylist1.name()).to(eq("Grand Master Comb"))
    end
  end

  describe("#==") do
    it("is the same stylist if the name is the same") do
      stylist1 = Stylist.new({:name => "Grand Master Comb", :id => nil})
      stylist2 = Stylist.new({:name => "Grand Master Comb", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end
end
