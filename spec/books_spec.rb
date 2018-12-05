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

  describe("#title") do
  it("tells you its title") do
    book = Book.new({:title => "Treasure Island", :book_id => 3})
    expect(book.title()).to(eq("Treasure Island"))
  end
end

describe("#id") do
  it("sets its book ID when you save it") do
    book = Book.new({:title => "A Christmas Carol", :book_id => 3})
    book.save()
    expect(book.book_id()).to(be_an_instance_of(Integer))
  end
end

describe("#save") do
  it("lets you save books to the database") do
    book = Book.new({:title => "Treasure Island", :book_id =>3})
    book.save()
    expect(Book.all()).to(eq([book]))
  end
end

end
