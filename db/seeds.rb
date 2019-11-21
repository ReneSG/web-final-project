# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
rene = User.create(email: "rene@gmail.com", password: "password")
jime = User.create(email: "jime@gmail.com", password: "password")
ed = User.create(email: "ed@gmail.com", password: "password")
rb = User.create(email: "rb@gmail.com", password: "password")

rene.polls.create(name: "Done 1", address: "Address 1", owner_id: rb.id, status: "done")
rene.polls.create(name: "Done 2", address: "Address 2", owner_id: ed.id, status: "done")
rene.polls.create(name: "Done 3", address: "Address 3", owner_id: jime.id, status: "done")
rene.polls.create(name: "Done 4", address: "Address 4", owner_id: ed.id, status: "done")

rene.polls.create(name: "Pending 1", address: "Address 1", owner_id: jime.id, status: "pending")
rene.polls.create(name: "Pending 2", address: "Address 2", owner_id: ed.id, status: "pending")
rene.polls.create(name: "Pending 3", address: "Address 3", owner_id: jime.id, status: "pending")
rene.polls.create(name: "Pending 4", address: "Address 4", owner_id: rb.id, status: "pending")
