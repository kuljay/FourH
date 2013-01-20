# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
#user = User.find_or_create_by_email :name => ENV['Firs User'].dup, :email => ENV['user@example.com'].dup, :password => ENV['pleasejay'].dup, :password_confirmation => ENV['pleasejay'].dup
#puts 'user: ' << user.name
#user.add_role :admin

user = User.find_or_create_by_email :name => 'First User', :email => 'user@example.com', :password => 'pleasejay', :password_confirmation => 'pleasejay'
puts 'user: ' << user.name
user.add_role :admin

user2 = User.find_or_create_by_email :name => 'Second User', :email => 'user2@example.com', :password => 'pleasejay', :password_confirmation => 'pleasejay'
puts 'user: ' << user2.name
user2.add_role :VIP