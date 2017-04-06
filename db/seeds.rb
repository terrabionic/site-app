# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: 'Administrador', description: 'Administrador del sistema', role: 'admin')
LoginManager.create(email_contact: 'admin@site.com')
TourManager.create(welcom: 'Bienvenido')
