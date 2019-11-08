class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :agencies, dependent: :destroy 
  accepts_nested_attributes_for :agencies
  validates_associated :agencies
  has_many :volunteers
  accepts_nested_attributes_for :volunteers
end
