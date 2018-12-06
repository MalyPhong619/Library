class Checkout
  attr_accessor :id, :book_id, :patron_id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @book_id = attributes.fetch(:book_id)
    @patron_id = attributes.fetch(:patron_id)

  end

  def self.all
    checkout_books = DB.exec("SELECT * from checkouts;")
    checkedout_books = []
    checkout_books.each() do |book|
      id = book.fetch("id")
      book_id = book.fetch("book_id")
      patron_id = book.fetch("patron_id")
      checkedout_books.push(Checkout.new({:id => id, :book_id => book_id, :patron_id => patron_id}))
  end
    checkedout_books
  end

  def save
    result = DB.exec("INSERT INTO checkouts (book_id, patron_id) VALUES (#{@book_id}, #{@patron_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def self.checking_out(book_id)
    @book = book_id.to_i()
    DB.exec("UPDATE books SET amount = (amount - 1) where id = #{@book};")
  end


end

#
# SELECT DATA_TYPE
# FROM INFORMATION_SCHEMA.COLUMNS
# WHERE
#      TABLE_NAME = 'checkouts' AND
#      COLUMN_NAME = 'book_id';
