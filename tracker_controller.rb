require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('controllers/merchants_controller.rb')
require_relative('models/merchant.rb')

require_relative('controllers/tags_controller')
require_relative('models/tag.rb')

require_relative('controllers/transactions_controller')

get '/' do
  erb (:index)
end


#---------------------------------MERCHANTS:

get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end


#---------------------------------MERCHANTS:


get '/tags' do
  @tags = Tag.all()
  erb (:"tags/index")
end
