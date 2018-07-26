require_relative('../db/sqlRunner.rb')
require_relative('merchant.rb')
require_relative('tag.rb')
require_relative('transaction.rb')
require( 'pry-byebug' )
require 'date'


class  Limit


  def self.monthly_spending_for(filter)
    @now = DateTime.now
    @merchants = Merchant.all()
    @transactions = Transaction.all()
    @tags = Tag.all()
    @monthly_spending_for = 0

    for transaction in @transactions
      if transaction.find_merchant.merchant_name == filter || transaction.find_tag.tag_name == filter
        if transaction.time_stamp.strftime("%-m") == @now.strftime("%-m")
          @monthly_spending_for += transaction.amount
        end
      end
    end
    return @monthly_spending_for
  end

end

p Limit.monthly_spending_for("groceries")
