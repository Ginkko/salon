require "./lib/client"
require "./lib/stylist"
require "sinatra"
require "sinatra/reloader"
require "pg"
require "pry"
also_reload("lib/**/*.rb")

DB = PG.connect({:dbname => "hair_salon"})
