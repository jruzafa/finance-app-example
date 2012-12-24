class ReportsController < ApplicationController

	before_filter :authenticate

	def index
		# call month entries
		@entries = Report.entries(current_user.id,false)

		# call month expenses
		@expenses = Report.expenses(current_user.id)

		# totals
		@total_entries = Report.total_entries(current_user.id)

		# totals
    	@total_expenses = Report.total_expenses(current_user.id)

		respond_to do |format|
			format.html # index.html.erb
			format.json
		end
	end

	def current_month
		# call month entries
		@entries = Report.entries(current_user.id, true)

		# call month expenses
		@expenses = Report.expenses(current_user.id, true)

		# totals
		@total_entries = Report.total_entries(current_user.id, true)

		# totals
    	@total_expenses = Report.total_expenses(current_user.id, true)

		respond_to do |format|
			format.html # index.html.erb
			format.json
		end
	end
end