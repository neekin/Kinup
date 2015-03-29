class Photo < ActiveRecord::Base
  belongs_to:photobook
  has_many:comments
end