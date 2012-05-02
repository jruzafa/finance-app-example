class Category < ActiveRecord::Base
 validates :name, :presence => true
 belongs_to :user
 has_many :entries
 has_many :expenses


 def self.category_user(id_category)
 	logger.debug "#{@current_user}"
 	return current_user
 	#return self.where("user_id = #{current_user.id}").find(@id_category)
 	#return true
 end


end
