class PhotosController < ApplicationController

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
        @photo= Photo.create(url: @filename)
        current_user.photos << @photo
    
        File.open("./public/images/#{@photo.url}", 'wb') do |f|
          f.write(file.read)
        end
        redirect to "/photos/#{@photo.id}"
      end
    
      post "/photos/:id" do
        @photo = Photo.find_by(params[:id])
        @photo.caption = params['photo']['caption']
        redirect to "/photos/#{@photo.id}"
      end
    
    
    
      # delete "/photo/:id/delete" do
      #   #redirect to "/photo/index"
      # end



end