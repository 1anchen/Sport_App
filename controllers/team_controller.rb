require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')

get '/team' do
  @teams = Team.find_all
  erb ( :"teams/index" )
end
