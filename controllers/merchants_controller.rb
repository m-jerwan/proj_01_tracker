require_relative('../models/merchant.rb')
require( 'pry-byebug' )

get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

#NEW
get "/merchants/new" do
  erb (:"merchants/new")
end # &CREATE
post "/merchants" do
  @merchant = Merchant.new(params)
  @merchant.save
  erb (:"merchants/create")
end

#SHOW
get '/merchants/:id' do
  @merchant = Merchant.find(params['id'])
  erb (:"merchants/show")
end

#edit
post "/merchants/:id/edit" do
  @merchant = Merchant.find(params['id'])
  erb (:"merchants/edit")
end # &UPDATE
post "/merchants/:id" do
  merchant = Merchant.new(params)
  merchant.update
  redirect to "merchants/#{params['id']}"
end
