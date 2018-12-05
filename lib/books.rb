class Book
attr_accessor :title, :book_id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @book_id = attributes.fetch(:book_id)
  end

  def self.all
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      title = book.fetch("title")
      book_id = book.fetch("book_id").to_i()
      books.push(Book.new({:title => title, :book_id => book_id}))
  end
    books
  end

  # def self.test_method_books
  #   books = DB.exec("SELECT * FROM books;")
  # end

  def save
    result = DB.exec("INSERT INTO books (title, book_id) VALUES ('#{@title}',#{@book_id}) RETURNING book_id;")
    @book_id = result.first().fetch("book_id").to_i()
  end

  def ==(another_book)
    self.title().==(another_book.title()).&(self.book_id().==(another_book.book_id()))
  end

end
