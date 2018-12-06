class Book
attr_accessor :title, :id, :amount

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
    @amount = attributes.fetch(:amount)

  end

  def self.all
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      title = book.fetch("title")
      id = book.fetch("id").to_i()
      amount = book.fetch("amount").to_i()
      books.push(Book.new({:title => title, :id => id, :amount => amount}))
  end
    books
  end

  def save
    result = DB.exec("INSERT INTO books (title, amount) VALUES ('#{@title}', #{@amount}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_book)
    self.title().==(another_book.title()).&(self.id().==(another_book.id()))
  end

  def self.find(id)
    found_book = nil
    Book.all().each() do |book|
      if book.id().==(id)
        found_book = book
      end
    end
    found_book
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    @id = self.id()
    DB.exec("UPDATE books SET title = '#{@title}' WHERE patron_id = #{@id};")
  end

  def delete
    DB.exec("DELETE from books WHERE id = #{self.id()};")
  end

end
