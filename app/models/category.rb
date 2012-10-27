class Category < ActiveRecord::Base

validates :name, :presence => true
belongs_to :user
has_many :entries
has_many :expenses

end