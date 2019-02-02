# psql -d cinema -f db/cinema.sql

require_relative( 'models/customer.rb' )
require_relative( 'models/film.rb' )
require_relative( 'models/ticket.rb' )

require('pry')

customer_1 = Customer.new({ 'name' => 'George', 'funds' => 8})
customer_1.save()
customer_2 = Customer.new({ 'name' => 'Laura', 'funds' => 5})
customer_2.save()

film_1 = Film.new({ 'title' => 'Love Actually', 'price' => 5})
film_1.save()
film_2 = Film.new({ 'title' => 'Titanic', 'price' => 6})
film_2.save()

# ticket_1 = Ticket.new({})
# ticket_1.save()
# ticket_2 = Ticket.new({})
# ticket_2.save()


binding.pry
nil
