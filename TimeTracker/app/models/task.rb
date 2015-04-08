class Task < ActiveRecord::Base
	has_many :timeentries
	belongs_to :project
end
