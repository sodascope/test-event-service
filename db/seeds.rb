# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.delete_all

Event.create!({ org: "dep1", hostname: "host1", description: "one event" })
Event.create!({ org: "dep1", hostname: "host1", description: "second event" })
Event.create!({ org: "dep1", hostname: "host1", description: "third event" })
Event.create!({ org: "dep1", hostname: "hostAB", description: "fourth event" })

Event.create!({ org: "dep2", hostname: "hostAB", description: "another event" })
Event.create!({ org: "dep2", hostname: "hostCAB", description: "a random event" })
Event.create!({ org: "dep2", hostname: "hostAB", description: "another random event" })

Event.create!({ org: "dep3", hostname: "hostAB", description: "another event" })
