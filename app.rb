require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:crud_pets.sqlite3"
Dir[__dir__+"/models/*.rb"].each {|file| require file }



get '/pets' do
  #index
  @pets = Pet.all
  erb :index
end
get '/pets/new' do
    #new
  erb :new
end

post '/pets' do
    #create
  Pet.create(name: params["name"], raza: params["raza"], edad: params["edad"], foto: params["foto"])
  redirect("/pets")
end

get '/pets/:id' do

  @pet = Pet.find_by(id: params["id"])
    #show
    erb :show
end

get '/pets/:id/edit' do
    #edit
    @pet = Pet.find_by(id: params["id"])
    erb :edit
end

patch '/pets' do
    #update
    p params
    pet = Pet.find_by(id: params["id"])
    pet.update(name: params["name"], raza: params["raza"], edad: params["edad"], foto: params["foto"])

    redirect("/pets")

end

delete '/pets' do
    #destroy
    pet = Pet.find_by(id: params["id"])
    pet.destroy
    redirect("/pets")
end
