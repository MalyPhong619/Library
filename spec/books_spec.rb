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
    book = Book.new({:title => "Treasure Island", :id => nil})
    expect(book.title()).to(eq("Treasure Island"))
  end
end

describe("#id") do
  it("sets its book ID when you save it") do
    book = Book.new({:title => "A Christmas Carol", :id => nil})
    book.save()
    expect(book.id()).to(be_an_instance_of(Integer))
  end
end

describe("#save") do
  it("lets you save books to the database") do
    book = Book.new({:title => "Treasure Island", :id => nil})
    book.save()
    expect(Book.all()).to(eq([book]))
  end
end

describe("#==") do
    it("is the same book if it has the same name") do
      book1 = Book.new({:title => "Epicodus", :id => nil})
      book2 = Book.new({:title => "Epicodus", :id => nil})
      expect(book1).to(eq(book2))
    end
  end

  describe(".find") do
  it("returns a book by its ID") do
    book = Book.new({:title => "Encyclopedia", :id => nil})
    book.save()
    book2 = Book.new({:title => "Dictionary", :id => nil})
    book2.save()
    expect(Book.find(book2.id())).to(eq(book2))
  end
end

describe("#update") do
  it("lets you update books in the database") do
    book = Book.new({:title => "Green Eggs and Ham", :id => nil})
    book.save()
    book.update({:title => "1 Fish 2 Fish"})
    expect(book.title()).to(eq("1 Fish 2 Fish"))
  end  
end

describe("#delete") do
    it("lets you delete a book from the database") do
      book1 = Book.new({:title => "Green eggs and ham", :id => nil})
      book1.save()
      book2 = Book.new({:title => "1 fish 2 fish", :id => nil})
      book2.save()
      book1.delete()
      expect(Book.all()).to(eq([book2]))
    end
  end

end
