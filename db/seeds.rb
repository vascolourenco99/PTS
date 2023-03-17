# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Event.destroy_all
Race.destroy_all
Event.create!({
  name: "PTS",
  user_id: 1
})

Race.create!({
  name: "Corrida 1/10tc",
  address: "Pista de Monsanto",
  event_id: 5
})

Race.create!({
  name: "Corrida 1/10tc",
  address: "Pista de Coimbra",
  event_id: 5
})

Race.create!({
  name: "Corrida 1/10tc",
  address: "Pista da Maia",
  event_id: 5
})
