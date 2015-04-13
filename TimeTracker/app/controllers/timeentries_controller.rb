class TimeentriesController < ApplicationController
	def index
		@customers = Customer.all
	end
	def show
		
	end

	def new
		@task = Task.find(params[:task_id])
		@timeentry = Timeentry.new(task_id: @task.id)
	end

	def edit
		@task = Task.find(params[:task_id])
		@timeentry = Timeentry.find(params[:id])
	end

	def create
		# raise params.inspect
		@task = Task.find(params[:task_id])
		start_time = Time.now
		@timeentry = Timeentry.new
		@timeentry.task = @task
		@timeentry.start_time = start_time
		@timeentry.user_id = current_user.id
		@timeentry.note = params[:timeentry][:note]

		@timeentry.save!

		redirect_to tasks_path
		
	end

	def update
		@timeentry = Timeentry.find(params[:id])
		end_time = Time.now
		if @timeentry.duration == nil 
			dur = end_time - (@timeentry.start_time)
			@timeentry.duration = dur
			@timeentry.save!
			redirect_to tasks_path
		else
			flash[:error] = "Can Not Update same Time Entry"
			redirect_to tasks_path
			# render 'edit'
		end
	end

	private
	def timeentry_params
		params.require(:timeentry).permit(:note,:duration,:start_time, :user_id)
	end
end
