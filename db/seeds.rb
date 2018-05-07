require('pry')
require_relative('../models/game')
require_relative('../models/team')


Game.delete_all()
Team.delete_all()

  score1 = Random.new
  score2 = Random.new



  team1 = Team.new({
      "name" => "Houston Rockets"
    })
  team2 = Team.new({
      "name" => "Golden State Worriors"
    })
  team3 = Team.new({
      "name" => "Boston Celtics"
    })
  team4 = Team.new({
      "name" => "Toronto Raptors"
    })
  team5 = Team.new({
      "name" => "Philadelphia Sixers"
    })
  team6 = Team.new({
      "name" => "Utah Jazz"
    })
  team7 = Team.new({
        "name" => "Cleveland Cavaliers"
    })
  team8 = Team.new({
        "name" => "New Oreans Pelicans"
    })

team1.save()
team2.save()
team3.save()
team4.save()
team5.save()
team6.save()
team7.save()
team8.save()

game1_match1 = Game.new({
    "home_team_id" => team1.id,
    "away_team_id" => team2.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game1_match1.save()
game1_match1.extra_time()
game1_match1.update()

game1_match2 = Game.new({
    "home_team_id" => team3.id,
    "away_team_id" => team4.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game1_match2.save()
game1_match2.extra_time()
game1_match2.update()

game1_match3 = Game.new({
    "home_team_id" => team5.id,
    "away_team_id" => team6.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game1_match3.save()
game1_match3.extra_time()
game1_match3.update()

game1_match4 = Game.new({
    "home_team_id" => team7.id,
    "away_team_id" => team8.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game1_match4.save()
game1_match4.extra_time()
game1_match4.update()

game2_match1 = Game.new({
    "home_team_id" => team1.id,
    "away_team_id" => team3.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game2_match1.save()
game2_match1.extra_time()
game2_match1.update()

game2_match2 = Game.new({
    "home_team_id" => team2.id,
    "away_team_id" => team4.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game2_match2.save()
game2_match2.extra_time()
game2_match2.update()

game2_match3 = Game.new({
    "home_team_id" => team5.id,
    "away_team_id" => team7.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game2_match3.save()
game2_match3.extra_time()
game2_match3.update()

game2_match4 = Game.new({
    "home_team_id" => team6.id,
    "away_team_id" => team8.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game2_match4.save()
game2_match4.extra_time()
game2_match4.update()

game3_match1 = Game.new({
    "home_team_id" => team1.id,
    "away_team_id" => team4.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game3_match1.save()
game3_match1.extra_time()
game3_match1.update()

game3_match2 = Game.new({
    "home_team_id" => team2.id,
    "away_team_id" => team3.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game3_match2.save()
game3_match2.extra_time()
game3_match2.update()

game3_match3 = Game.new({
    "home_team_id" => team5.id,
    "away_team_id" => team8.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game3_match3.save()
game3_match3.extra_time()
game3_match3.update()

game3_match4 = Game.new({
    "home_team_id" => team6.id,
    "away_team_id" => team7.id,
    "home_team_score" => score1.rand(80..120),
    "away_team_score" => score2.rand(80..120)
  })
game3_match4.save()
game3_match4.extra_time()
game3_match4.update()

binding.pry
nil
