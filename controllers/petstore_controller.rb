require_relative('../models/petstore.rb')

get '/stores' do
@stores = Store.all()
erb :"petstore/index"
end

get '/stores/new' do
  erb :"petstore/new"
end

post '/stores' do
  @store = Store.new(params)
  @store.save()
  redirect '/stores'
end

get '/stores/:id' do
  @store = Store.find(params[:id])
  @pets = @store.pets()
  erb :"petstore/show"
end

get '/stores/:id/edit' do
@store = Store.find(params[:id])
erb :"petstore/edit"
end

post '/stores/:id' do
  @store = Store.new( params )
  @store.update()
  redirect to("/stores/#{params['id']}")
end

delete '/stores/:id' do
#DELETE
end