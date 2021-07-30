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
  @all_volunteers = Volunteer.all()
  erb(:view_project)
end

get '/volunteers/:id' do
  @volunteer = Volunteer.find(params[:id])
  erb(:view_volunteer)
end

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
  @project = Project.find(params[:id].to_i)
  @project.update(params[:title])
  @volunteers = @project.volunteers
  @all_volunteers = Volunteer.all()
  erb(:view_project)
end

patch '/projects/:id/assign' do
  @project = Project.find(params[:id].to_i)
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  @volunteer.assign_project(@project.id)
  @volunteers = @project.volunteers()
  @all_volunteers = Volunteer.all()
  erb(:view_project)
end

patch '/projects/:id/unassign' do
  @project = Project.find(params[:id].to_i)
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  @volunteer.assign_project(0)
  @volunteers = @project.volunteers()
  @all_volunteers = Volunteer.all()
  erb(:view_project)
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

delete '/projects/:id/delete_self' do
  @project = Project.find(params[:id].to_i)
  @project.delete()
  redirect to ('/')
end