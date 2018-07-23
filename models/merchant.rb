require_relative('../db/sqlRunner.rb')
require( 'pry-byebug' )


class Merchant
  attr_reader :id, :merchant_name
  # attr_accessor :merchant_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
  end

  def save
    sql = "INSERT INTO merchants(merchant_name) VALUES ($1) RETURNING id"
    values = [@merchant_name]
    hash = SqlRunner.run(sql, values).first
    @id = hash['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM merchants"
    hashes = SqlRunner.run(sql)
    result = hashes.map { |e| Merchant.new(e)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    hash = SqlRunner.run(sql, values).first
    result =  Merchant.new(hash)
    return result
  end

  def update
    sql = "UPDATE merchants SET merchant_name = $1 WHERE id = $2"
    values = [@merchant_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_by(id)
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end
end
