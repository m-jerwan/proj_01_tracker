require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('controllers/merchants_controller.rb')
require_relative('controllers/tags_controller')
require_relative('controllers/transactions_controller')
require_relative('models/limit')

get '/' do
  @now = DateTime.now
  @merchants = Merchant.all()
  @transactions = Transaction.all()
  @tags = Tag.all()
  erb (:index)
end
