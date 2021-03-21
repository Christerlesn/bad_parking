require './app/controllers/application_controller'

class ImagesController < ApplicationController

  get '/images' do
      @images = Image.all
      @users = User.all
      erb :'images/image_index'
    end
  
    get '/images/new' do
      erb :"images/image_new"
    end
  
    get '/images/:id' do
      @image = Image.find(params[:id])
      erb :"images/image"
    end
  
    get '/images/:id/edit' do
      if logged_in?
        @image = Image.find_by(params[:id])
        if @image
          erb :"images/image_edit"
        else
          redirect to '/images'
        end
      else
        redirect "/login"
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
    
  
    post '/images/:id' do
      @image = Image.find(params[:id])
      @image.caption = params[:caption]
      @image.url = params[:file][:filename]
      file = params[:file][:tempfile]
      @image.save
      
      File.open("./public/#{@image.url}", 'wb') do |f|
        f.write(file.read)
      end
      redirect to "/images/#{@image.id}"
    end

    delete "/images/:id/delete" do
      @image = Image.find_by_id(params[:id])
      @Image.delete
      
      redirect to "/image/index"
    end



end