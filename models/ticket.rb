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

  def self.all()
    sql = "SELECT FROM tickets"
    value = []
    tickets = SqlRunner.new(sql, values)
    result = tickets.map { |ticket| Ticket.new(ticket) }
    return result
  end



  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

end
