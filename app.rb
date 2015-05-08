require "./lib/client"
require "./lib/stylist"
require "sinatra"
require "sinatra/reloader"
require "pg"
require "pry"
also_reload("lib/**/*.rb")

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all
  erb(:stylists)
end

post('/stylists') do
  name = params.fetch('name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save
  @stylists = Stylist.all
  erb(:stylists)
end

get('/stylists/new') do
  erb(:stylist_add)
end

get('/clients') do
  @clients = Client.all
  erb(:clients)
end

post('/clients') do
  erb(:clients)
end

get('/clients/new') do
  erb(:client_add)
end
