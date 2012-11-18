class Report < ActiveRecord::Base

	# return the current month now
	def self.current_month
		return Date.new(Time.now.year, Time.now.month).to_time
	end

	# return entries for current month
	def self.month_entries(user)

		time = current_month

		#return Entry.where(:created_at => time..time.end_of_month, :user_id => user);
		return Entry.where(:created_at => time.beginning_of_month..time.end_of_month, :user_id => user).order('created_at DESC');
		#return Entry.all
	end

	# return expensesn for current month
	def self.month_expenses(user)

		time = current_month

		#return Entry.where(:created_at => time..time.end_of_month, :user_id => user);
		return Expense.where(:created_at => time.beginning_of_month..time.end_of_month, :user_id => user).order('created_at DESC');
		#return Entry.all
	end

  # return the total of amount field the entries for current month
	def self.total_entries(user)
		time = current_month
		return Entry.where(:created_at => time.beginning_of_month..time.end_of_month, :user_id => user).sum('amount');
	end

	# return the total of amount field the expenses for current month
  def self.total_expenses(user)
    time = current_month
    return Expense.where(:created_at => time.beginning_of_month..time.end_of_month, :user_id => user).sum('amount');
  end

end
