require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require( 'pry-byebug' )


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

#-----------------------------------TRANSACTIONS:
transaction_01 = Transaction.new({
  "merchant_id" => merchant_03.id,
  "tag_id" => tag_04.id
})



#-----------------------------------OTHER:





# binding.pry
nil
