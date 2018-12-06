require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/books")
require("./lib/patrons")
require("./lib/checkouts")
require("pg")

DB = PG.connect({:dbname => "library"})

get('/') do
  @books = Book.all()
  @patrons = Patron.all()
  erb(:index)
end


get('/books/edit') do

  erb(:books)
end

get('/patrons/edit') do

  erb(:patrons)
end
