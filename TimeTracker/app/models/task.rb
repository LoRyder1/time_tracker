class Task < ActiveRecord::Base
	has_many :timeentries
	belongs_to :project

	def self.total(task,user)
		all_te = Timeentry.where(user_id: user.id, task_id: task.id)
		durations = []
		all_te.each do |te|
			durations << te.duration
		end
		
		durations.delete(nil)
		durations.inject{ |sum,x| sum += x}
	end
end
