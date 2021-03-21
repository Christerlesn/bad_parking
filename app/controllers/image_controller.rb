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
      @image = Image.find(params[:id])
      erb :"images/image_edit"
    end

    post '/images' do
      
      @filename = params[:file][:filename]
        file = params[:file][:tempfile]
        @image= Image.create!(url:@filename)
        current_user.images << @image
        
        File.open("./public/#{@image.url}", 'wb') do |f|
          f.write(file.read)
        end

      # @photo = Photo.new
      # @photo.image = params[:file][:filename]
      # image = params[:file][:tempfile]
      # # params[:file]
      # @photo.caption = params[:caption]
      # @photo.save
      # current_user.photos << @photo

      redirect to "/images/#{@image.id}"
    end
    
  
    # post '/photos/:id' do
    #   @photo = Photo.find(params[:id])
    #   @photo.name = params['photo']
    #   @photo.save
    #   redirect to "/photos/#{@photo.id}"
    # end

    delete "/images/:id/delete" do
      @image = Image.find_by_id(params[:id])
      @Image.delete
      
      redirect to "/image/index"
    end



end