require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @funds = details['funds']
  end

  def save()
    sql = "INSERT INTO customers
          (name, funds)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end






end
