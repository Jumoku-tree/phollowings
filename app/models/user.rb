class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :works
  has_many :likes

  validates :name, presence: true, length: { maximum: 10 , message: "must be within 10 characters"}
  validates :password, length: { minimum: 8, message: "must be 8 characters or more" }
end
