class Entry < ActiveRecord::Base
  validates :amount, :presence => true
  validates :concept, :presence => true
  # validates :type, :presence => true
  belongs_to :category
  belongs_to :user
  belongs_to :type
end
