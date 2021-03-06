require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require( 'pry-byebug' )
#-----------------------------------PREP:
Transaction.delete_all
Merchant.delete_all
Tag.delete_all


#-----------------------------------MERCHANTS:
merchant_01 = Merchant.new({
  "merchant_name" => "Tesco"
})
merchant_02 = Merchant.new({
  "merchant_name" => "Asda"
})
merchant_03 = Merchant.new({
  "merchant_name" => "Bonnie Tiler"
})
merchant_04 = Merchant.new({
  "merchant_name" => "Shell"
})
merchant_05 = Merchant.new({
  "merchant_name" => "Jamies Italian"
})

merchant_01.save()
merchant_02.save()
merchant_03.save()
merchant_04.save()
#-----------------------------------TAGS:
tag_01 = Tag.new({
  "tag_name" => "groceries"
})
tag_02 = Tag.new({
  "tag_name" => "fuel"
})
tag_03 = Tag.new({
  "tag_name" => "services"
})
tag_04 = Tag.new({
  "tag_name" => "construction"
})
tag_05 = Tag.new({
  "tag_name" => "food and drink"
})

tag_01.save
tag_02.save
tag_03.save
tag_04.save
#-----------------------------------TRANSACTIONS:
transaction_01 = Transaction.new({
  "time_stamp" => "2018-06-01 20:20:00",
  "amount" => "110.40",
  "merchant_id" => merchant_03.id,
  "tag_id" => tag_04.id
})
transaction_02 = Transaction.new({
  "time_stamp" => "2018-07-01 16:15:00",
  "amount" => "4.99",
  "merchant_id" => merchant_01.id,
  "tag_id" => tag_01.id
})
transaction_03 = Transaction.new({
  "time_stamp" => "2018-07-01 13:017:01",
  "amount" => "50.11",
  "merchant_id" => merchant_04.id,
  "tag_id" => tag_02.id
})

transaction_01.save
# transaction_02.save
# transaction_03.save
# p transaction_01.time_stamp.strftime("at %I:%M%p on %A")

#-----------------------------------OTHER:
p Transaction.all
transaction_01.merchant_id = merchant_04.id
transaction_01.update
p Transaction.all


# binding.pry
nil
