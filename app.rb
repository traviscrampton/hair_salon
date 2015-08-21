require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get("/stylists/new") do
  erb(:stylist_form)
end

post('/stylists') do
  name = params.fetch('stylist')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:success)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post("/clients") do
  title = params.fetch("title")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:title => title, :stylist_id => stylist_id})
  @client.save()
  erb(:success)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end
