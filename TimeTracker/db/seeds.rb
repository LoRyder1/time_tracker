User.create!(username: "Bob", password: "password", password_confirmation: "password", email: "bob@mail.com")
Customer.create!(company: "Big company")
Project.create!(project_name: "something1", customer_id: 1)
Task.create!(task_name: "blah blah")
Timeentry.create!(project_id: 1, user_id:1, task_id: 1)














# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# require 'csv'
# require 'forecast_io'

# # Create a OneCrime class so that when the crimes are parsed from the 2013 Chicago Crime CSV file, the crimes can be converted into Ruby Crime objects so that they can be manipulated in Ruby

# class Customer
# 	attr_reader :company, :address1, :address3, :city, :state, :zip, :phone1, :phone2, :fax1, :fax2, :email, :website
#   def initialize(options={})
# 		@company = options[:company]
#     @address1 = options[:address1]
#     @address3 = options[:address3]
#     @city = options[:city]
#     @state = options[:state]
#     @zip = options[:zip]
#     @phone1 = options[:phone1]
#     @phone2 = options[:phone2]
#     @fax1 = options[:fax1]
#     @fax2 = options[:fax2]
#     @email = options[:email]
#     @website = options[:website]
#   end
# end

# # Create a Parse class which loads the crimes from the CSV files, parses them, and converts each individual crime into a OneCrime object

# class Parse
#   attr_reader :customers
#   def initialize
#     @customers = []
#   end

#   def load_customers(filename)
#     CSV.foreach(filename, headers: true, header_converters: :symbol) do |row_data|
#       @customers << Customer.new(row_data)
#     end
#   end
# end

# # Create an instance of Parse in order to load the crimes from the CSV file.
# parse = Parse.new

# parse.load_customers("Customers.csv")

# p parse.customers













# # parsed_crimes = parse.crimes

# # Once the crimes are loaded and parsed, create Crimes that can be stored in the database

# # parsed_crimes.each do |wrongdoing|
# #   Crime.create!(date: wrongdoing.date, primary_type: wrongdoing.primary_type, description: wrongdoing.description, location_description: wrongdoing.location_description, latitude: wrongdoing.latitude, longitude: wrongdoing.longitude, community_area: wrongdoing.community_area, district: wrongdoing.district, block: wrongdoing.block)
# # end
