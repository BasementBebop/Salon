require("sinatra")
require("sinatra/reloader")
require("pg")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")

DB = PG.connect({:dbname => "salon"})

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end
