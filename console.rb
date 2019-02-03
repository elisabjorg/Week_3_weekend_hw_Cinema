# psql -d cinema -f db/cinema.sql

require_relative( 'models/customer.rb' )
require_relative( 'models/film.rb' )
require_relative( 'models/ticket.rb' )

require('pry')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer_1 = Customer.new({ 'name' => 'George', 'funds' => 8})
customer_1.save()
customer_2 = Customer.new({ 'name' => 'Laura', 'funds' => 5})
customer_2.save()
customer_3 = Customer.new({ 'name' => 'Amy', 'funds' => 10})
customer_3.save()

film_1 = Film.new({ 'title' => 'Love Actually', 'price' => 5})
film_1.save()
film_2 = Film.new({ 'title' => 'Titanic', 'price' => 6})
film_2.save()
film_3 = Film.new({ 'title' => 'Notting hill', 'price' => 10})
film_3.save()

ticket_1 = Ticket.new({'customer_id' => customer_1.id, 'film_id' => film_1.id})
ticket_1.save()
ticket_2 = Ticket.new({'customer_id' => customer_2.id, 'film_id' => film_2.id})
ticket_2.save()
ticket_3 = Ticket.new({'customer_id' => customer_3.id, 'film_id' => film_3.id})
ticket_3.save()

customer_1.name = 'Hannah'
customer_1.update

film_3.title = 'Bring it on'
film_3.update()

ticket_3.customer_id = customer_2.id
ticket_3.update()







binding.pry
nil
