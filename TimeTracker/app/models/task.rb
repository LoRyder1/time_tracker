class Task < ActiveRecord::Base
	has_one :timeentry
	belongs_to :project

	def self.total(user)
		all_te = Timeentry.where(user_id: user.id)
		durations = []
		all_te.each do |te|
			durations << te.duration
		end
		durations.delete(nil)
		sum = durations.inject{ |sum,x| sum += x}
		
		Time.at(sum).gmtime.strftime('%R:%S') if sum != nil
	end
end
