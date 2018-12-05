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

end
