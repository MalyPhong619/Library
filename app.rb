require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/books")
require("./lib/patrons")
require("./lib/checkouts")
require("pg")

DB = PG.connect({:dbname => "library"})

get('/') do
  @books = Books.all()
  @patrons = Patrons.all()
end
