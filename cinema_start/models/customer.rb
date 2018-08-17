require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i

  end

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds)
    = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
          INNER JOIN tickets
          ON films.id = tickets.film_id
          INNER JOIN customers
          ON customers.id = tickets.customer_id
          WHERE customers.id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return Film.map_items(customer_data)
    # SELECT customers.name,films.title FROM films
    # INNER JOIN tickets
    # ON films.id = tickets.film_id
    # INNER JOIN customers
    # ON customers.id = tickets.customer_id;
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.map_items(data)
    result = data.map{|customer| Customer.new(customer)}
    return result
  end



end
