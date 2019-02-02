require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @customer_id = details['customer_id'].to_i
    @film_id = details['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets
          (customer_id, film_id)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

end 
