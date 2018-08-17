require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')


require ('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({ 'name' => 'Alan', 'funds' => 100 })
customer1.save()
customer2 = Customer.new({ 'name' => 'Rachel', 'funds' => 80 })
customer2.save()
customer3 = Customer.new({ 'name' => 'Liam', 'funds' => 60 })
customer3.save()
customer4 = Customer.new({ 'name' => 'Claire', 'funds' => 60 })
customer4.save()

film1 = Film.new({ 'title' => 'Jacobs Ladder', 'price' => 3 })
film1.save()
film2 = Film.new({ 'title' => 'Fantastic Voyage', 'price' => 5})
film2.save()
film3 = Film.new({ 'title' => 'Fear and Loathing in Las Vegas', 'price' => 15 })
film3.save()
film4 = Film.new({ 'title' => 'The Acid House', 'price' => 10 })
film4.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film4.id })
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film4.id })
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film4.id })
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer4.id, 'film_id' => film4.id })
ticket4.save()
ticket5 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket5.save()
ticket6 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film1.id })
ticket6.save()
ticket7 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film2.id })
ticket7.save()
ticket8 = Ticket.new({ 'customer_id' => customer4.id, 'film_id' => film2.id })
ticket8.save()
ticket9 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film3.id })
ticket9.save()








binding.pry
nil
