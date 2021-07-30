require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
also_reload 'lib/**/*.rb'
require 'pry'
require "pg"

DB = PG.connect({ dbname: 'volunteer_tracker', host: 'db', user: 'postgres', password: 'password' })

get '/' do
  @volunteers = Volunteer.all()
  @projects = Project.all()
  erb(:index)
end

get '/projects/:id' do
  @project = Project.find(params[:id])
  @volunteers = @project.volunteers
  erb(:view_project)
end

# get '/volunteers/:id' do
#   @volunteer = Volunteer.find(params[:id])
#   erb(:view_volunteer)
# end

post '/projects' do
  @project = Project.new({:title => params[:project_title], :id => nil})
  @project.save()
  redirect to ('/')
end

post '/volunteers' do
  @projects = Project.all()
  @volunteer = Volunteer.new({:name => params[:volunteer_name], :id => nil, :project_id => params[:project_id]})
  @volunteer.save()
  redirect to ('/')
end

patch '/projects/:id' do
  @update_project = Project.find(params[:id].to_i)
  @update_project.update(params[:title])
  # redirect to ('/projects/:id')
  erb(:update_project)
end


delete '/volunteers/:id/remove' do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  @volunteer.remove()
  redirect to ('/')
end


delete '/projects/:id/delete' do
  @project = Project.find(params[:project_id].to_i)
  @project.delete()
  redirect to ('/')
end