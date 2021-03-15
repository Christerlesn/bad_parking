require_relative '../models/uploader/upload_photo'

class Photo < ActiveRecord::Base
    belongs_to :user
    # validates :url, presence: true, uniqueness:true
    mount_uploader :file, PhotosUploader
end