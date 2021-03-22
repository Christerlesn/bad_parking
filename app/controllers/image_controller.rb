require './app/controllers/application_controller'

class ImagesController < ApplicationController

  get '/images' do
      @images = Image.all
      @users = User.all
      erb :'images/image_index'
    end
  
    get '/images/new' do
      if !logged_in?
        redirect "/login"
      else
        erb :"images/image_new"
      end
    end
  
    get '/images/:id' do
      @image = Image.find(params[:id])
      erb :"images/image"
    end
  
    get '/images/:id/edit' do
      if !logged_in?
        redirect "/login"
      else
        @image = Image.find(params[:id])
        if @image.user_id == current_user.id
          erb :"images/image_edit"
        else
          #flash message could go here that says "Sorry, you cannot edit this image. It belongs to a different user."
          redirect '/images'
        end
      end
    end

    post '/images' do
      puts "===================================="
       puts "===================================="
      @filename = params[:file][:filename]
      file = params[:file][:tempfile]
      
      @image= Image.create!(url:@filename, caption:params[:caption])
      current_user.images << @image

       File.open("./public/#{@image.url}", 'wb') do |f|
        f.write(file.read)
      end

     redirect to "/images/#{@image.id}"
  end
    
  
  patch '/images/:id' do
    @image = Image.find(params[:id])
      
    if @image.update(:caption => params[:caption])
      
      # file = params[:file][:tempfile]

      # File.open("./public/#{@image.url}", 'wb') do |f|
      #   f.write(file.read)
  
      redirect to "/images/#{@image.id}"
    else
      redirect to '/images'
    end
  end


    delete "/images/:id/delete" do
      @image = Image.find(params[:id])
      @image.destroy
      
      redirect to "/images"
    end



end