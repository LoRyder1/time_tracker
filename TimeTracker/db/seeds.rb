User.create!(username: "Bob", password: "password", password_confirmation: "password", email: "bob@mail.com")
Customer.create!(company: "Milton")
Project.create!(project_name: "Paradise Lost", customer_id: 1)
Task.create!(task_name: "it is a long road", project_id: 1)
Timeentry.create!(project_id: 1, user_id:1, task_id: 1, start_time: Time.now, duration: 100, note: "this should finish up the last elements")

require 'csv'

import_file = "db/Customers.csv"

x = File.open(import_file)
array = []
x.each do |line|
  array << line.gsub("\r","")
end

new_file = "db/C_reformatted.csv"
# new_file = "C_reformatted.csv"

File.new(new_file, "w+")
File.open(new_file, 'w') do |file|
  array.each do |x|
    file << x
  end
end

class Customer1
	attr_reader :company, :address1, :address3, :city, :state, :zip, :phone1, :phone2, :fax1, :fax2, :email, :website
  def initialize(options={})
		@company = options[:company]
    @address1 = options[:address1]
    @address3 = options[:address3]
    @city = options[:city]
    @state = options[:state]
    @zip = options[:zip]
    @phone1 = options[:phone1]
    @phone2 = options[:phone2]
    @fax1 = options[:fax1]
    @fax2 = options[:fax2]
    @email = options[:email]
    @website = options[:website]
  end
end

# Create a Parse class which loads the crimes from the CSV files, parses them, and converts each individual crime into a OneCrime object

class Parse
  attr_reader :customers
  def initialize
    @customers = []
  end

  def load_customers(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol, skip_blanks: true) do |row_data|
      customers << Customer1.new(row_data)
    end
  end

  def create_customers
    customers.each do |customer|
      Customer.create!(company: customer.company, address1: customer.address1, address3: customer.address3, city: customer.city, state: customer.state, zip: customer.zip, phone1: customer.phone1, phone2: customer.phone2, fax1: customer.fax1, fax2: customer.fax2, email: customer.email, website: customer.website)
    end
  end
end



parse = Parse.new

parse.load_customers(new_file)

parse.create_customers





