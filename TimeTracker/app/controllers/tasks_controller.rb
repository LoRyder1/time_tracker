class TasksController < ApplicationController
	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
		@projects = Project.all

	end

	def create
		@task = Task.new(task_params)

		@task.save!
		redirect_to tasks_path
	end

	private
	def task_params
		params.require(:task).permit(:task_name, :project_id)
	end
end
