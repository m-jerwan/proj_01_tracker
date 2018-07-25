require 'date'
require_relative('../models/transaction.rb')
require( 'pry-byebug' )

get '/transactions' do
  @transactions = Transaction.all()
  @now = DateTime.now
  @month_back = @now.prev_month
  @this_month_no = @now.strftime("%-m")
  @month_minus_one_no = (@this_month_no.to_i - 1).to_s
  erb (:"transactions/index")
end

#NEW
get "/transactions/new" do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb (:"transactions/new")
end # &CREATE
post "/transactions" do
  @transaction = Transaction.new(params)
  @transaction.save
  erb (:"transactions/create")
end

#SHOW
get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb (:"transactions/show")
end

#edit
post "/transactions/:id/edit" do
  @transaction = Transaction.find(params['id'])
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb (:"transactions/edit")
end # &UPDATE
post "/transactions/:id" do
  params['time_stamp'] = "#{params['date_time_1']} #{params['date_time_2']}"
  transaction = Transaction.new(params)
  transaction.update
  redirect to "transactions"
end

#delete
post "/transactions/:id/delete" do
  transaction = Transaction.find(params['id'])
  transaction.delete
  redirect to "transactions"
end

#====================================OTHER:
#YEAR VIEW
get '/transactions/year/:year' do
  @transactions = Transaction.all()
  @year_on_page = params['year']
  @now = DateTime.now
  erb (:"transactions/yearly/index")
end


get '/transactions/month/:month' do
  @month_on_page = params['month']
  case params['month']
    when "1"
      @month_on_page_word = "January"
    when "2"
      @month_on_page_word = "February"
    when "3"
      @month_on_page_word = "March"
    when "4"
      @month_on_page_word = "April"
    when "5"
      @month_on_page_word = "May"
    when "6"
      @month_on_page_word = "June"
    when "7"
      @month_on_page_word = "July"
    when "8"
      @month_on_page_word = "August"
    when "9"
      @month_on_page_word = "September"
    when "10"
      @month_on_page_word = "October"
    when "11"
      @month_on_page_word = "November"
    when "12"
      @month_on_page_word = "December"
  end

  @transactions = Transaction.all()
  @now = DateTime.now
  @month_back = @now.prev_month
  erb (:"transactions/monthly/index")
end
