class UsersController < ApplicationController
    
  get '/signup' do
    if logged_in?
      redirect "/images"
    else
      erb :'users/sign_up'
    end
  end
    
  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/images'
    end
  end
    
      get '/login' do
        if logged_in?
          redirect "/images"
        else
          erb :'users/login'
        end
      end
    
      post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to "/images"
        else
          redirect to '/signup'
        end
      end
    
      get "/logout" do
        if logged_in?
          session.destroy
          redirect "/login"
        else
          redirect "/"
        end
      end

end