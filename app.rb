require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
also_reload 'lib/**/*.rb'
require 'pry'
require "pg"

DB = PG.connect({ dbname: 'volunteer_tracker', host: 'db', user: 'postgres', password: 'password' })

get '/' do
  "This is connected to the database #{DB.db}."
end
