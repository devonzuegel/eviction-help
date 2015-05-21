# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicag },
#                         { name: 'Copenhagen' }])
#            Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Question.create! YAML.load_file(Rails.root.join('db', 'seeds', 'questions.yml'))
Defense.create!  YAML.load_file(Rails.root.join('db', 'seeds', 'defense.yml'))