class Photo < ActiveRecord::Base
  belongs_to:photobook
  has_many:comments
  mount_uploader :path, PhotoUploader
end