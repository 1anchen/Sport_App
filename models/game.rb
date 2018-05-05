require_relative('../db/sqlrunner')


class Game

  attr_reader :id
  attr_accessor :home_team_id, :away_team_id, :home_team_score, :away_team_score

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @home_team_id = options["home_team_id"]
    @away_team_id = options["away_team_id"]
    @home_team_score = options["home_team_score"].to_i
    @away_team_score = options["away_team_score"].to_i
  end

  def save()
    sql = "INSERT INTO games
          (home_team_id,away_team_id,home_team_score,away_team_score)
          VALUES
          ($1,$2,$3,$4)
          RETURNING id"
    values = [@home_team_id,@away_team_id,@home_team_score,@away_team_score]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id']
  end

  def self.delete_all
    sql = "DELETE FROM games"
    SqlRunner.run(sql)
  end

end
