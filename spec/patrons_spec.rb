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

#   describe("#name") do
#   it("tells you its name") do
#     patron = Patron.new({:name => "Chris", :user_id => 3})
#     expect(patron.name()).to(eq("Chris"))
#   end
# end
#
#   describe("#id") do
#     it("sets its book ID when you save it") do
#       book = Book.new({:title => "A Christmas Carol", :book_id => 3})
#       book.save()
#       expect(book.book_id()).to(be_an_instance_of(Integer))
#     end
#   end
#
#   describe("#save") do
#     it("lets you save books to the database") do
#       book = Book.new({:title => "Treasure Island", :book_id =>3})
#       book.save()
#       expect(Book.all()).to(eq([book]))
#     end
#   end

end
