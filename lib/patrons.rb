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
      user_id = patron.fetch("user_id").to_i()
      patrons.push(Book.new({:name => name, :user_id => user_id}))
  end
    patrons
  end

  def save
    result = DB.exec("INSERT INTO partrons (name, user_id) VALUES ('#{@name}', #{@user_id} RETURNING user_id;")
    @user_id = result.first().fetch("user_id").to_i()
  end

  def ==(another_patron)
    self.name().==(another_patron.name()).&(self.user_id().==(another_patron.user_id()))
  end

end
