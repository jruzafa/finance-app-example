class Report < ActiveRecord::Base
	
		def self.current_month
			return Date.new(Time.now.year, Time.now.month).to_time
		end
	


	# return entries for current month
	def self.month_entries(user)

		time = current_month

		#return Entry.where(:created_at => time..time.end_of_month, :user_id => user);
		return Entry.where(:created_at => time.beginning_of_month..time.end_of_month, :user_id => user);
		#return Entry.all
	end

	# return entries for current month
	def self.month_expenses(user)

		time = current_month

		#return Entry.where(:created_at => time..time.end_of_month, :user_id => user);
		return Expense.where(:created_at => time.beginning_of_month..time.end_of_month, :user_id => user);
		#return Entry.all
	end

	def self.total_entries(user)
		time = current_month
		return Expense.select('SUM(amount)').where(:created_at => time.beginning_of_month..time.end_of_month, :user_id => user)
	end

end
