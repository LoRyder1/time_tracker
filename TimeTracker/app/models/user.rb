class User < ActiveRecord::Base
	has_many :timeentries

	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	attr_reader :entered_password

	def password
		@password ||= BCrypt::Password.new(password_hash)
	end

	def password=(new_password)
		@entered_password = new_password
		@password = BCrypt::Password.create(new_password)
		self.password_hash = @password
	end

	def self.authenticate(email, password)
		user = User.find_by_email(email)
		return user if user && (user.password == password)
		nil
	end
end
