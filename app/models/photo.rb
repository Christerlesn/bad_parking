require_relative '../uploader/upload_photo'

class Photo < ActiveRecord::Base
    belongs_to :user
    validates :url, presence: true, uniqueness:true
    mount_uploader :photo, ImagesUploader
end