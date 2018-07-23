require 'date'
require_relative('../models/transaction.rb')
require( 'pry-byebug' )


get '/transactions' do
  @transactions = Transaction.all()

  @now = DateTime.now
  @this_month_no = @now.strftime("%-m")
  @month_minus_one_no = (@this_month_no.to_i - 1).to_s

  erb (:"transactions/index")
end

get '/transactions/:month' do
  @month_on_page = params['month']

  @transactions = Transaction.all()
  @now = DateTime.now
  erb (:"transactions/month")
end
