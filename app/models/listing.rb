class Listing < ApplicationRecord
  belongs_to :user
  #the listing NEEDS to have those 3 params
  validates :title, :description, :price, presence:true
  has_one_attached :picture
end
