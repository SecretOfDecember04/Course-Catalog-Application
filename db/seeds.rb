# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed DB with at least 1 default Admin
User.create(first_name: "Default", last_name: "Admin", 
    email: "admin.1@osu.edu", 
    password: "DftAdm001", 
    role: "Admin",
    is_approved: true)

puts "Default admin user created! Email: admin.1@osu.edu, Password: DftAdm001"