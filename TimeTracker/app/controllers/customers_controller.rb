class CustomersController < ApplicationController
	def index
		redirect_to root_path if logged_in? == false
		@customers = Customer.all
	end
	def show
		@projects = Project.where(customer_id: params[:id])
	end
end
