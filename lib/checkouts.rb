class Checkouts
  attr_accessor :id, :book_id, :patron_id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @book_id = attributes.fetch(:book_id)
    @patron_id = attributes.fetch(:patron_id)
  end

  def self.all
    checkout_books = []
    
  end



end
