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

get('/stylists/:id') do
  stylist_id = params.fetch('id').to_i
  @stylist = Stylist.find(stylist_id)
  @clients = @stylist.clients
  @all_clients = Client.all
  erb(:stylist)
end

post('/stylists/:id') do
  stylist_id = params.fetch('id').to_i
  @stylist = Stylist.find(stylist_id)
  client_id = params.fetch('clients').to_i
  @stylist.client_add(client_id)
  @all_clients = Client.all
  erb(:stylist)
end


get('/clients') do
  @clients = Client.all
  erb(:clients)
end

post('/clients') do
  name = params.fetch('name')
  client = Client.new({:name => name, :id => nil, :stylist_id => nil})
  client.save
  @clients = Client.all
  erb(:clients)
end

get('/clients/new') do
  erb(:client_add)
end

get('/clients/:id') do
  client_id = params.fetch('id').to_i
  @client = Client.find(client_id)
  erb(:client)
end

delete('/client_delete') do
  client_id = params.fetch('client_id').to_i
  client = Client.find(client_id)
  client.delete
  erb(:deleted)
end
