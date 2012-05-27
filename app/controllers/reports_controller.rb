class ReportsController < ApplicationController
  
  before_filter :authenticate

	def index

	
		# call month entries
		@entries = Report.month_entries(current_user.id)

		# call month expenses
		@expenses = Report.month_expenses(current_user.id)

		# totals
		@total_entries = Report.total_entries(current_user.id)


		respond_to do |format|
			format.html # index.html.erb
		end

	end
end