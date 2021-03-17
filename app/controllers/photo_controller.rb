class PhotosController < ApplicationController

  get '/photos' do
      @photos = Photo.all
      @users = User.all
      erb :'photos/photo_index'
    end
  
    get '/photos/new' do
      erb :"photos/photo_new"
    end
  
    get '/photos/:id' do
      @photo = Photo.find_by(params[:id])
      erb :"photos/photo"
    end
  
    get '/photos/:id/edit' do
      @photo = Photo.find(params[:id])
      erb :"photos/photo_edit"
    end

    post '/photos' do
      
      @filename = params[:file][:filename]
        image = params[:file][:tempfile]
        @photo= Photo.create!(url:@filename)
        current_user.photos << @photo
        
        # File.open("./public/#{@image.url}", 'wb') do |f|
        #   f.write(file.read)

      # @photo = Photo.new
      # @photo.image = params[:file][:filename]
      # image = params[:file][:tempfile]
      # # params[:file]
      # @photo.caption = params[:caption]
      # @photo.save
      # current_user.photos << @photo

      redirect to "/photos/#{@photo.id}"
    end
    
  
    # post '/photos/:id' do
    #   @photo = Photo.find(params[:id])
    #   @photo.name = params['photo']
    #   @photo.save
    #   redirect to "/photos/#{@photo.id}"
    # end

    delete "/photos/:id/delete" do
      @photo = Photo.find_by_id(params[:id])
      @photo.delete
      
      redirect to "/photo/index"
    end



end