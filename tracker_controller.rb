require( 'pry-byebug' )
require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('controllers/merchants_controller.rb')
require_relative('controllers/tags_controller')
require_relative('controllers/transactions_controller')

get '/' do
  erb (:index)

  #for main index page/stats/alerts
end
