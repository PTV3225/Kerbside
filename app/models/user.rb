class User < ApplicationRecord

  has_many :messages
  has_many :posts, dependent: :destroy
  has_many :treasures, through: :posts

  acts_as_favoritor

  #might need to add first name and last name into the db for users and also photo for avatar


  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
