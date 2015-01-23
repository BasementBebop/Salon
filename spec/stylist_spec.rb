require("spec_helper")

describe(Stylist) do

  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
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
