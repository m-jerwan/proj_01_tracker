require 'date'
require_relative('../models/transaction.rb')
require( 'pry-byebug' )

get '/transactions' do
  transactions = Transaction.all()
  now = DateTime.now

  #compare all transactions months to this month and get only with this months month
  this_month_no = now.strftime("%-m")
  @transactions_this_month =[]
  for transaction in transactions
    @transactions_this_month << transaction if transaction.time_stamp.strftime("%-m") == this_month_no
  end

  last_month = (this_month_no.to_i - 1).to_s
  @transactions_month_minus_one =[]
  for transaction in transactions
    @transactions_month_minus_one << transaction if transaction.time_stamp.strftime("%-m") == last_month
  end


  erb (:"transactions/index")
end
