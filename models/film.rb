require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @price = details['price']
  end

  def save()
    sql = "INSERT INTO films
          (title, price)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def self.all()
    sql = "SELECT FROM films"
    values = []
    films = SqlRunner(sql, values)
    result = films.map { |film| Film.new(film) }
    return result
  end


  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end


end
