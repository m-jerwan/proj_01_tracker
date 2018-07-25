require_relative('../models/tag.rb')

get '/tags' do
  @tags = Tag.all()
  erb (:"tags/index")
end

#NEW
get "/tags/new" do
  erb (:"tags/new")
end # &CREATE
post "/tags" do
  @tag = Tag.new(params)
  @tag.save
  erb (:"tags/create")
end

#SHOW
get '/tags/:id' do
  @tag = Tag.find(params['id'])
  erb (:"tags/show")
end

#edit
post "/tags/:id/edit" do
  @tag = Tag.find(params['id'])
  erb (:"tags/edit")
end # &UPDATE
post "/tags/:id" do
  tag = Tag.new(params)
  tag.update
  redirect to "tags/#{params['id']}"
end

#delete
post "/tags/:id/delete" do
  tag = Tag.find(params['id'])
  tag.delete
  redirect to "tags"
end
