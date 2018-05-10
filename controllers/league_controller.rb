require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team')
require_relative('../models/game')

get '/user/league_table' do
  @teams = Team.all()
  @league = Array.new
  @league = @teams.sort_by {|team| [team.win_persentage, team.name]}
  @league.reverse!
  erb ( :"user/league_table/standing")
end
