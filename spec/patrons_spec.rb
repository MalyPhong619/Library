require("rspec")
require("pg")
require("patrons")
require("spec_helper")


  describe(Patron) do
    describe(".all") do
      it("starts off with no patrons") do
        expect(Patron.all()).to(eq([]))
    end
  end

  describe("#name") do
  it("tells you its name") do
    patron = Patron.new({:name => "Chris", :id => nil})
    expect(patron.name()).to(eq("Chris"))
  end
end

  describe("#id") do
    it("sets its patron ID when you save it") do
      patron = Patron.new({:name => "Maly", :id => nil})
      patron.save()
      expect(patron.id()).to(be_an_instance_of(Integer))
    end
  end

  describe("#save") do
    it("lets you save patron to the database") do
      patron = Patron.new({:name => "Treasure Island", :id => nil})
      patron.save()
      expect(Patron.all()).to(eq([patron]))
    end
  end

end
