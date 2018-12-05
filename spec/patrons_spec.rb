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

  describe("#==") do
      it("is the same patron if it has the same name") do
        patron1 = Patron.new({:name => "Epicodus", :id => nil})
        patron2 = Patron.new({:name => "Epicodus", :id => nil})
        expect(patron1).to(eq(patron2))
      end
    end

    describe(".find") do
    it("returns a patron by its ID") do
      patron = Patron.new({:name => "Joe", :id => nil})
      patron.save()
      patron2 = Patron.new({:name => "Chris", :id => nil})
      patron2.save()
      expect(Patron.find(patron2.id())).to(eq(patron2))
    end
  end

end
