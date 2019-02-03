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

  def update()
    sql = "UPDATE films SET title = $1 WHERE id = $2"
    values = [@title, @id]
    SqlRunner.run( sql, values )
  end

  def customer()
    sql = "SELECT customers.* FROM customers
           INNER JOIN tickets ON customers.id = tickets.customer_id
           WHERE film_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return Customer.map_items(customer_data)
  end

  # def self.get_price(title)
  #   sql = "SELECT price FROM films WHERE title = $1"
  #   return SqlRunner(sql)[0]['price']
  # end


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

  def self.map_items(data)
    result = data.map{|film| Film.new(film)}
    return result
  end


end
