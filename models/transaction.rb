require_relative('../db/sqlRunner.rb')
require( 'pry-byebug' )


class Transaction
  attr_reader :id, :amount, :time_stamp

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @time_stamp = DateTime.parse(options['time_stamp'])
    @amount = options['amount'].to_f
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end



  #------------------------------------------~OTHER:

  def find_merchant
    #find merchant with id i have
    return Merchant.find(@merchant_id)
  end

  def find_tag
    #find merchant with id i have
    return Tag.find(@tag_id)
  end

  #------------------------------------------~CRUD:

  def save
    sql = "INSERT INTO transactions(amount, merchant_id, tag_id, time_stamp) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@amount, @merchant_id, @tag_id, @time_stamp]
    hash = SqlRunner.run(sql, values).first
    @id = hash['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM transactions ORDER BY time_stamp"
    hashes = SqlRunner.run(sql)
    result = hashes.map { |e| Transaction.new(e)}
    return result   #  CHECKED, COMES BACK ORDERED!!
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

Transaction.all
