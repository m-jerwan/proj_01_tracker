require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require( 'pry-byebug' )

require 'date'


#time range
#list of possible MERCHANTS:
#list of possible TAGS

#get random merchant / save
#get random tag / save
#get random float
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
  #rand time
  rand_time_h = Random.rand(1...23)
  rand_time_m = Random.rand(1...59)
  rand_time_s = Random.rand(1...59)
  date_time = DateTime.parse("2018-#{rand_month}-#{rand_day} #{rand_time_h}:#{rand_time_m}:#{rand_time_s}")

  #if random_date_time > TODAY, do it again
  if date_time.strftime('%Q') > DateTime.now.strftime('%Q')    ##this comparising is not working properly FIX!!!
    random_date_time()
  end
  return date_time
end

def randomize(tag)
  sleep(rand() / 10.0)
  if tag == "groceries"
    random_merchant = @all_merchants['merchants_groceries'].sample
    random_amount = (Random.rand(0.5...40.0)).round(2)
  elsif tag == "misc"
    random_merchant = @all_merchants['merchants_misc'].sample
    random_amount = (Random.rand(0.1...20.0)).round(2)
  elsif tag == "bills"
    random_merchant = @all_merchants['merchants_bills'].sample
    random_amount = (Random.rand(30..100.0)).round(2)
  elsif tag == "cash"
    random_merchant = @all_merchants['merchants_cash'].sample
    random_amount = Random.rand(1...30)*10
  elsif tag == "food_and_drink"
    random_merchant = @all_merchants['merchants_food_and_drink'].sample
    random_amount = (Random.rand(1..100.0)).round(2)
  elsif tag == "fuel"
    random_merchant = @all_merchants['merchants_fuel'].sample
    random_amount = (Random.rand(30...50.0)).round(2)
  end
  random_transaction = [
    random_merchant,
    tag,
    random_date_time().to_s,
    random_amount
  ]
  return random_transaction
end


def randomise_and_seed(times, tag)
times.times {|x|
  result = randomize(tag)
  merchant_x = Merchant.new({
    "merchant_name" => result[0]
    })
  merchant_x.save
  tag_x = Tag.new({
    "tag_name" => result[1]
    })
    tag_x.save
  transaction_x = Transaction.new({
    "time_stamp" => result[2],
    "amount" => result[3],
    "merchant_id" => merchant_x.id,
    "tag_id" => tag_x.id
    })
  transaction_x.save
  }
end
#========================================================EXEC_SEED:
randomise_and_seed(200, "groceries")
randomise_and_seed(50, "misc")
randomise_and_seed(50, "fuel")
randomise_and_seed(90, "food_and_drink")
randomise_and_seed(24, "bills")
randomise_and_seed(100, "cash")
