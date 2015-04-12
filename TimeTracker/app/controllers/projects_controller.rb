class ProjectsController < ApplicationController
	def index
		@customer = Customer.find(params[:customer_id])		
		
	end

	def new
		@customer = Customer.find(params[:customer_id])
		@project = Project.new
	end

	def create
		@customer = Customer.find(params[:customer_id])
		@project = Project.new(project_params)
		@project.customer_id = @customer.id
		@project.save
		redirect_to customer_projects_path(@customer)
	end

	private
	def project_params
		params.require(:project).permit(:project_name)
	end
end
