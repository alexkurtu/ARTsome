class User < ApplicationRecord
  has_many :arts
  has_many :bookings
  has_many :reviews
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, :address, :bio, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
