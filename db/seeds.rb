# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

southAmericaAlert = Alert.create(
  email: 'jose@test.com', 
  name: 'Jose', 
  user_id: 1, 
  state: 1, 
  outbound_start: Date.new(2018, 1, 5), 
  outbound_end: Date.new(2018, 1, 7), 
  inbound_start: Date.new(2018, 1, 10), 
  inbound_end: Date.new(2018, 1, 12), 
  start_airports: 'DEN', 
  end_airports: 'UIO,BOG', 
  trip_len_min: -1, 
  trip_len_max: -1, 
  price_limit: 200, 
  auto_alert: false
)

europeAlert = Alert.create(
  email: 'john@test.com', 
  name: 'John', 
  user_id: 2, 
  state: 1, 
  outbound_start: Date.new(2018, 2, 5), 
  outbound_end: Date.new(2018, 2, 7), 
  inbound_start: Date.new(2018, 2, 10), 
  inbound_end: Date.new(2018, 2, 12), 
  start_airports: 'DEN', 
  end_airports: 'ORY,LHR', 
  trip_len_min: -1, 
  trip_len_max: -1, 
  price_limit: 300, 
  auto_alert: false
)

Deal.create(
  alert_id: southAmericaAlert.id, 
  price: 1000, 
  start_airport: 'DEN', 
  end_airport: 'UIO', 
  outbound: Date.new(2018, 1, 6), 
  inbound: Date.new(2018, 1, 10), 
  link: 'www.hipmunk.com'
)

Deal.create(
  alert_id: europeAlert.id, 
  price: 1200, 
  start_airport: 'DEN', 
  end_airport: 'ORY', 
  outbound: Date.new(2018, 2, 5), 
  inbound: Date.new(2018, 2, 11), 
  link: 'www.hipmunk.com'
)
