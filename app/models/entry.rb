class Entry < ActiveRecord::Base
  validates :amount, :presence => true
  validates :concept, :presence => true
  belongs_to :category
  belongs_to :user
end
