class Patron
attr_accessor :name, :user_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @user_id = attributes.fetch(:user_id)
  end

  def self.all
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      user_id = patron.fetch("user_id")
      patrons.push(Book.new({:name => name, :user_id => user_id}))
  end
    patrons
  end


end
