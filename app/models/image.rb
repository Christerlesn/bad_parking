require_relative '../models/uploader/upload_image'

class Image < ActiveRecord::Base
    belongs_to :user
    # validates :url, presence: true, uniqueness:true
    mount_uploader :file, ImagesUploader
end