class Photobook < ActiveRecord::Base
  has_many:photo
  validates :bookname ,presence: true
end