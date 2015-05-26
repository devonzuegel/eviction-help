# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'faker'
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Question.create! YAML.load_file(Rails.root.join('db', 'seeds', 'questions.yml'))
Defense.create!  YAML.load_file(Rails.root.join('db', 'seeds', 'defenses.yml'))
Court.create!  YAML.load_file(Rails.root.join('db', 'seeds', 'courts.yml'))

# Create Attorneys and associated Users
12.times do |n|
  email    = Faker::Internet.email
  password = Faker::Internet.password
  name     = Faker::Name.name

  user = User.create!( email: email,
                       password: password,
                       password_confirmation: password,
                       name: name,
                       god_mode: false,
                     )

  office_address = Faker::Address.street_address
  fax_number     = Faker::Number.number(10)
  bar_number     = Faker::Number.number(6)

  attorney = Attorney.create!( office_address: office_address,
                               fax_number: fax_number,
                               bar_number: bar_number,
                               user: user,
                              )
  pp user
  pp attorney
end