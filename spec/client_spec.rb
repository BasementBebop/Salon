require("spec_helper")

describe(Client)do

  describe(".all") do
    it("returns all clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a client to the database") do
      test_client = Client.new({:name => "Flash Gordon", :stylist_id => 1, :id => nil})
      expect(test_client.name()).to(eq("Flash Gordon"))
    end
  end

  describe("#==") do
    it("is the same client if the name is the same") do
      client1 = Client.new({:name => "Flash Gordon", :stylist_id => 1, :id => nil})
      client2 = Client.new({:name => "Flash Gordon", :stylist_id => 1, :id => nil})
      expect(client1).to(eq(client2))
    end
  end
end
