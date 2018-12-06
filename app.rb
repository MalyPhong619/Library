require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/books")
require("./lib/patrons")
require("./lib/checkouts")
require("pry")
require("pg")

DB = PG.connect({:dbname => "library"})

get('/') do
  @books = Book.all()
  @patrons = Patron.all()
  @checkouts = Checkout.all()
  # binding.pry
  erb(:index)
end


get('/books/edit') do

  erb(:books)
end

post('/books') do
  book = Book.new({title: params["title"], amount:params["amount"], id: nil})
  book.save
  redirect ('/')
end

get('/patrons/edit') do
  erb(:patrons)
end

post('/patrons') do
  patron = Patron.new({name: params["name"], id: nil})
  patron.save()
  redirect ('/')
end

get ('/patrons/:id') do
  @patron_id = params[:id].to_i
  @patron = Patron.find(@patron_id)
  @patronbooks = Book.checkout(@patron_id)
  # binding.pry
  erb(:patron)
end

get ('/books/:id') do
  @book_id = params[:id].to_i
  @book = Book.find(@book_id)
  erb(:book)
end

get ('/checkout') do
  @books = Book.all()
  @patrons = Patron.all()
  erb(:checkout)
end

post('/checkout') do
  book_id = params["book_id"]
  Checkout.checking_out(book_id)
  checkout = Checkout.new({id: nil, book_id: params["book_id"], patron_id: params["patron_id"]})
  checkout.save()
  # @book_id = params["book_id"]
  # Checkout.checking_out()
  redirect('/')
end

get ('/checkin') do
  @books = Book.all()
  @patrons = Patron.all()
  erb(:checkout)
end
