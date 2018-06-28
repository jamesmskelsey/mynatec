# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  PartNumber.create!(number: "12345", niin: "013217654", publication_id: 1)
  PartNumber.create!(number: "12345", niin: "013217654", publication_id: 2)
  PartNumber.create!(number: "56789", niin: "013217654", publication_id: 1)
  PartNumber.create!(number: "56789", niin: "013217654", publication_id: 2)
 end