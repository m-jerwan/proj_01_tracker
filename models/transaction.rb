require_relative('../db/sqlRunner.rb')

class Transaction
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @time_stamp = options['time_stamp']
  end



end
