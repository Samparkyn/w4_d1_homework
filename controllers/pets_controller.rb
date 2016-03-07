require_relative('../models/pet.rb')
require_relative('../models/petstore.rb')


post '/pets' do
  #CREATE
  @pet = Pet.new( params )
  @pet.save()
  redirect to("/stores/#{params['store_id']}")
end

get '/pets/:id' do
  #SHOW
  @pet = Pet.find(params[:id])
  @stores = @pet.store()
  erb :"pets/show"
end

get '/pets/:id/edit' do
  #EDIT
  @pet = Pet.find(params[:id])
  @stores = Store.all()
  erb :"pets/edit"
end

post '/pets/:id' do
  #UPDATE
  @pet = Pet.new( params )
  @pet.update()
  redirect to("/stores/#{params['team_id']}")
end

delete '/pets/:id' do
  #DELETE
end