require_relative('../models/merchant.rb')


get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end
