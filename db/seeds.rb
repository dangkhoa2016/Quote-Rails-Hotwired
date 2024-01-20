# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

attr = { email: 'admin@local.admin' }
user = User.find_by(attr)
if (user.blank?)
  user = User.new(attr)
  company = Company.find_or_create_by(name: 'Startup')
  user.company = company
  user.password = '123456'
  user.confirmed_at = Time.now if user.respond_to?(:confirmed_at)
  user.save
  puts "Created user #{user.email}"
else
  puts "User #{user.email} already exists"
end
