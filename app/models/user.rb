class User < ActiveRecord::Base
  validates :email, :presence => true
  validates :password, :presence => true
  has_many :categories
  has_many :entries
end
