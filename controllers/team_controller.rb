require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')

get '/admin/team' do
  @teams = Team.all()
  erb ( :"admin/teams/index" )
end

get '/admin/team/new' do
  erb ( :"admin/teams/new")
end

post '/admin/team/show' do
  team = Team.new(params)
  team.save()
  redirect to '/admin/team/show'
end

get '/admin/team/show' do
  @teams = Team.all()
  erb ( :"admin/teams/show")
end

post '/admin/team/:id/delete' do
  Team.delete(params[:id])
  redirect to '/admin/team'
end
