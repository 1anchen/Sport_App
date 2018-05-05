require_relative('../models/game')
require_relative('../models/team')
require('pry')

Game.delete_all()
Team.delete_all()

team1 = Team.new({
    "name" => "Houston Rockets"
  })
team2 = Team.new({
    "name" => "Golden State Worriors"
  })

team1.save()
team2.save()

game1 = Game.new({
    "home_team_id" => "team1.id",
    "away_team_id" => "team2.id",
    "home_team_score" => 116,
    "away_team_score" => 108
  })
