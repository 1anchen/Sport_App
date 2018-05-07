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

post '/team' do
  team = Team.new(params)
  team.save()
end
