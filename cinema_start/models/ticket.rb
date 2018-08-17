require_relative("../db/sql_runner")


class Ticket

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i

  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
    VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    tickets = SqlRunner.run(sql, values).first
    @id = tickets['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (name, funds)
    = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    values = []
    tickets = SqlRunner.run(sql, values)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.map_items(data)
    result = data.map{|ticket| Ticket.new(ticket)}
    return result
  end



end
