class Project < ActiveRecord::Base
  belongs_to :customer
  has_many :timeentries
  has_many :tasks
end
