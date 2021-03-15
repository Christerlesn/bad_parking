require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "something_secretive"
  end

  # get "/" do
  #   erb :"users/index"
  # end

  # get "/signup" do
  #   erb :"users/sign_up"
  #       # POST to "/photo/index"
  # end

  # get "/login" do
  #   erb :"users/login"
  #   # POST to "/photo/index"
  # end

  # post "/logout" do
  # # session.destroy
  # end

  get "/photos" do
    @photos = Photo.all
    @users = User.all
    erb :"photos/photo_index"
  end

  get "/photos/new" do
    erb :"photos/photo_new"
  end

  get "/photos/:id" do
    @photo = Photo.find_by(params[:id])
    erb :"photos/photo"
  end

  get "/photos/:id/edit" do
    @photo = Photo.find_by(params[:id])
    erb :"photos/photo_edit"
  end

  post "/photos" do
    @filename = params[:file][:filename]
    file = params[:file][:tempfile]
    @photo = Photo.create(:url => @filename)

    File.open("./public/images/#{@photo.url}", 'wb') do |f|
      f.write(file.read)
    end
    erb :"photos/photo_index"
  end

  post "/photos/:id" do
    @photo = Photo.find_by(params[:id])
    @photo.caption = ['photo']['caption']
    redirect to "/photos/#{@photo.id}"
  end



  # delete "/photo/:id/delete" do
  #   #redirect to "/photo/index"
  # end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end

end # End of Application Controller.rb
