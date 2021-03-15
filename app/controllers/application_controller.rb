require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :"users/index"
  end

  get "/signup" do
    erb :"users/sign_up"
        # POST to "/photo/index"
  end

  get "/login" do
    erb :"users/login"
    # POST to "/photo/index"
  end

  get "/photo/index" do
    #Shows all the photos
    erb :"photos/photo_index"
  end

  post "/photo/index" do
    #Shows all the photos
    erb :"photos/photo_index"
  end

  get "/photo/new" do
    erb :"photos/photo_new"
    #POST to "/photo/index"
  end

  get "/photo/:id" do
    erb :"photos/photo"
  end

  get "/photo/:id/edit" do
    erb :"photos/photo_edit"
  end

  patch "/photo/:id/edit" do
    #POST to "/photo/:id"
  end

  delete "/photo/:id/delete" do
    #redirect to "/photo/index"
  end

end
