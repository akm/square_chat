# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Rails.env.development?

  users = []
  pw = 'password'
  User.with_options(password: pw, password_confirmation: pw) do |u|
    users = [
      u.create!(email: 'user1@example.com'),
      u.create!(email: 'user2@example.com'),
      u.create!(email: 'user3@example.com'),
    ]
  end

  users.each.with_index(1) do |user, idx|
    User.current(user) do
      Organization.create!(name: "org#{idx}").tap do |org|
        org.rooms.create!(name: 'general')
        org.rooms.create!(name: 'random')
      end
    end
  end
end
