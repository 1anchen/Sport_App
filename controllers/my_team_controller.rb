require('sinatra')
require('pry')
require('sinatra/contrib/all')
require_relative('../models/team')

get '/my_teams' do
  @new_position = Team.all.sort_by {|team| [team.name]}
  erb(:"my_teams/index")
end

get '/my_teams/:id' do
  @team = Team.find(params[:id])
  erb(:"my_teams/show")
end

get '/my_teams/:id/results' do
  @results = Team.games(params[:id])
  @team = Team.find(params[:id])
  erb(:"my_teams/results")
end
