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
