class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end
	def show
		@projects = Project.all
	end
end
