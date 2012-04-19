class Type < ActiveRecord::Base
  belongs_to :user
  has_many :entries
  has_many :expenses
end
