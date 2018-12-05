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
      id = book.fetch("book_id")
      books.push(Book.new({:title => title, :book_id => book_id}))
  end
    books
  end

  # def self.test_method_books
  #   books = DB.exec("SELECT * FROM books;")
  # end

end
