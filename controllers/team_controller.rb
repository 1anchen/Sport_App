require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')

get '/team' do
  @teams = Team.all()
  erb ( :"teams/index" )
end

get '/team/new' do
  erb ( :"teams/new")
end

post '/team' do
  team = Team.new(params)
  team.save()
  redirect to '/team'
end

get '/team/show' do
  @teams = Team.all()
  erb ( :"teams/show")
end

post '/team/:id/delete' do
  Team.delete(params[:id])
  redirect to '/team'
end

get '/team/:id/edit' do
  @team = Team.find(params[:id])
  erb( :"teams/edit" )
end

post '/team/:id/edit' do
  team= Team.new(params)
  team.update()
  redirect to "/team"
end
