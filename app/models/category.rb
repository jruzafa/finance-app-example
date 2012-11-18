class Category < ActiveRecord::Base
	validates :name, :presence => true
	belongs_to :user
	has_many :entries, :dependent => :destroy
	has_many :expenses, :dependent => :destroy
end