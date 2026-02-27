# This file should contain all the record creation needed to test the application.
# The data can be loaded with `bin/rails db:seed` (or alongside the db creation with `bin/rails db:setup`).

# Create admin and buyer users
puts "Creating admin user..."
admin = User.find_or_create_by!(email: 'admin@propsales.ai') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.role = 'admin'
end
puts "Admin user created: #{admin.email}"

puts "Creating sample buyer user..."
buyer_user = User.find_or_create_by!(email: 'buyer@propsales.ai') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.role = 'buyer'
end
puts "Buyer user created: #{buyer_user.email}"

puts "\nCreating sample properties..."

Property.create!(
  title: "Premium Residential Plot",
  colony_name: "Green Valley",
  plot_number: "A-101",
  size: 1200.00,
  price: 4500000,
  status: "available",
  description: "Prime residential plot in Green Valley colony with excellent connectivity and modern amenities."
)

Property.create!(
  title: "Corner Plot",
  colony_name: "Green Valley",
  plot_number: "A-102",
  size: 1500.00,
  price: 5500000,
  status: "available",
  description: "Spacious corner plot with park facing view. Perfect for your dream home."
)

Property.create!(
  title: "Park Facing Plot",
  colony_name: "Green Valley",
  plot_number: "A-103",
  size: 1350.00,
  price: 5000000,
  status: "reserved",
  description: "Beautiful plot facing central park with serene environment."
)

Property.create!(
  title: "Large Family Plot",
  colony_name: "Green Valley",
  plot_number: "A-104",
  size: 2000.00,
  price: 7500000,
  status: "sold",
  description: "Extra large plot perfect for building a spacious family home."
)

Property.create!(
  title: "Affordable Housing Plot",
  colony_name: "Sunrise Colony",
  plot_number: "B-201",
  size: 1000.00,
  price: 3500000,
  status: "available",
  description: "Affordable housing plot in developing area with great investment potential."
)

Property.create!(
  title: "Premium Location",
  colony_name: "Sunrise Colony",
  plot_number: "B-202",
  size: 1100.00,
  price: 3800000,
  status: "available",
  description: "Well-located plot with easy access to main road and amenities."
)

Property.create!(
  title: "Luxury Plot",
  colony_name: "Palm Springs",
  plot_number: "C-301",
  size: 2500.00,
  price: 9500000,
  status: "available",
  description: "Luxury plot in premium gated community with all modern amenities."
)

Property.create!(
  title: "Garden Plot",
  colony_name: "Palm Springs",
  plot_number: "C-302",
  size: 1800.00,
  price: 6800000,
  status: "available",
  description: "Plot with garden area, perfect for nature lovers."
)

# Create sample buyers
puts "Creating sample buyers..."

sold_property = Property.find_by(plot_number: "A-104")
Buyer.create!(
  name: "Rajesh Kumar",
  phone: "9876543210",
  property: sold_property,
  sale_price: 7500000,
  purchase_date: Date.new(2026, 2, 15),
  review: "Great experience! The process was smooth and transparent. Highly recommended."
)

puts "Sample data created successfully!"
puts "Properties: #{Property.count}"
puts "Buyers: #{Buyer.count}"
