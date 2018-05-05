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

  def self.delete_all
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end



end
