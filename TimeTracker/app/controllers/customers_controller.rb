class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end
	def show
		@projects = Project.where(customer_id: params[:id])
	end
end
