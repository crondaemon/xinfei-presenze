# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create do |u|
  u.username              = 'dariolombardo'
  u.fullname              = 'Dario Lombardo'
  u.email                 = 'dariolombardo@xinfei.org'
  u.password              = 'cisalpina'
  u.password_confirmation = 'cisalpina'
  u.roles                 = Chaltron.roles
  u.active								= true
end
