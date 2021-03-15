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

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

  end

end # End of Application Controller.rb
