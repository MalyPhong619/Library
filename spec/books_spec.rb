require("rspec")
require("pg")
require("books")
require("spec_helper")

  describe(Book) do
    describe(".all") do
      it("starts off with no books") do
        expect(Book.all()).to(eq([]))
    end
  end

end
