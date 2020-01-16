class Work < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :post
end
