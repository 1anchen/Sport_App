require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')

get '/team' do
  @teams = Team.find_all
  erb ( :"teams/index" )
end

get '/team/new' do
  erb ( :"teams/new")
end

post '/team/show' do
  team = Team.new(params)
  team.save()
  redirect to '/team/show'
end

get '/team/show' do
  @teams = Team.find_all
  erb ( :"teams/show")
end

post '/team/:id/delete' do
  Team.delete(params[:id])
  redirect to '/team'
end
