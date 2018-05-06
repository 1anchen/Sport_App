require_relative('../db/sqlrunner')

class Team

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO teams
           (name)
           VALUES
           ($1)
           RETURNING id "
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE teams
           SET name
           = $1
           WHERE id = $2"
    values = [@name,@id]
    SqlRunner.run(sql,values)
  end


  def self.delete(id)
    sql = "DELETE FROM teams WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM teams WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    team = self.map_item(result)
    return team
  end

  def self.find_all
    sql = "SELECT * FROM teams "
    result = SqlRunner.run(sql)
    team = self.map_item(result)
    return team
  end

  def self.map_item(team_hashes)
    result = team_hashes.map{|team_hash| self.new(team_hash)}
    return result
  end
end
