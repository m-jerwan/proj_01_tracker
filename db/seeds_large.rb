require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require( 'pry-byebug' )

require 'date'


#time range?
#list of possible MERCHANTS:
#list of possible TAGS

#get random merchant / save
#get random tag / save
#get random float?
#random time
#create transacion based on those /save

#-----------------------------------PREP:
Transaction.delete_all
Merchant.delete_all
Tag.delete_all

#-----------------------------------MERCHANTS:


@all_merchants = {
  "merchants_groceries" => [
    "Asda",
    "Tesco",
    "Waitrose",
    "Sainsburry",
    "Home Bargains",
    "Iceland",
    "Aldi",
    "Lidl"
  ],
  "merchants_misc" => [
    "Alis cave",
    "Johnes shop",
    "On the Corner",
    "All shop",
    "Poundland",
    "Apple"
  ],
  "merchants_fuel" => [
    "Morrisons",
    "Asda",
    "Tesco",
    "Shell",
    "Bp"
  ],
  "merchants_food_and_drink" => [
    "McDonnalds",
    "Kfc",
    "Brewers Fayre",
    "Wildfire",
    "Hipster_coffee_heaven",
    "Pepper"
  ],
  "merchants_bills" => [
    "British Gas",
    "NrG",
    "Utilities warehouse"
  ],
  "merchants_cash" => [
    "Natwest ATM",
    "HSBC ATM",
    "RBS ATM"
  ]
}

#-----------------------------------TAGS:

@all_tags = [
  "groceries",
  "misc",
  "fuel",
  "food_and_drink",
  "bills",
  "cash"
]

#-----------------------------------Dates:
def random_date_time

  #rand rand_month
    rand_month = Random.rand(1..12)
  #rand rand_day
  if rand_month == 2
    rand_day = Random.rand(1...28)
  elsif rand_month == 1 || rand_month == 3 || rand_month == 5 || rand_month == 7 || rand_month == 8 || rand_month == 10 || rand_month == 12
    rand_day = Random.rand(1...31)
  else
    rand_day = Random.rand(1...30)
  end
  #rand time???
  rand_time_h = Random.rand(1...23)
  rand_time_m = Random.rand(1...59)
  rand_time_s = Random.rand(1...59)

  date_time = "2018-#{rand_month}-#{rand_day} #{rand_time_h}:#{rand_time_m}:#{rand_time_s}"
  date_time =  DateTime.parse(date_time)

  #if random_date_time > TODAY, do it again
  random_date_time() if date_time.to_s > DateTime.now.to_s

  return date_time
end

def randomize(type)
  sleep(rand() / 10.0)
  random_merchant = @all_merchants['merchants_groceries'].sample if type == "groceries"
  random_merchant = @all_merchants['merchants_misc'].sample if type == "misc"
  random_merchant = @all_merchants['merchants_bills'].sample if type == "bills"
  random_merchant = @all_merchants['merchants_cash'].sample if type == "cash"
  random_transaction = "#{random_date_time()} #{random_merchant} #{type} "
  return random_transaction
end


10.times {p randomize("groceries")}
10.times {p randomize("misc")}
10.times {p randomize("bills")}
10.times {p randomize("cash")}
