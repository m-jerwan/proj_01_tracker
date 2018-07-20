require_relative('../db/sqlRunner.rb')

class Transaction
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @time_stamp = options['time_stamp']
  end

  def save
    sql = "INSERT INTO transactions(merchant_id, tag_id) VALUES ($1, $2) RETURNING id"
    values = [@merchant_id, @tag_id]
    hash = SqlRunner.run(sql, values).first
    @id = hash['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM transactions"
    hashes = SqlRunner.run(sql)
    result = hashes.map { |e| Transaction.new(e)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    hash = SqlRunner.run(sql, values).first
    result =  Transaction.new(hash)
    return result
  end

  def update
    #no update as violates foreign key violations
  end

  def delete
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end
end
