class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# We're going to specify that the user can have many listings
# if the user gets deleted all their listings will get destroyed
has_many :listings, dependent: :destroy



end
