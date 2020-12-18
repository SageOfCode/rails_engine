require 'csv'

# before running "rake db:seed", do the following:
# - put the "rails-engine-development.pgdump" file in db/data/
# - put the "items.csv" file in db/data/

# cmd = "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d rails_engine_development db/data/rails-engine-development.pgdump"
# puts "Loading PostgreSQL Data dump into local database with command:"
# puts cmd
# system(cmd)

# csv_text = File.read('db/data/items.csv')
# csv = CSV.parse(csv_text, headers: true)
# csv.each do |row|
#   Item.create!(row.to_hash)
# end



# require 'csv'
cmd = "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d rails_engine_development db/data/rails-engine-development.pgdump"
puts "Loading PostgreSQL Data dump into local database with command:"
puts cmd
system(cmd)
file = './db/data/items.csv'
CSV.foreach(file, headers: true) do |row|
  data = row.to_h
  m = Merchant.find_or_initialize_by(id: row["merchant_id"])
  m.id = row["merchant_id"]
  m.name = Faker::Company.name
  m.save
  data["unit_price"] = data["unit_price"].to_f / 100.round(2)
  Item.create!(data)
end
puts "There are now #{Item.count} rows in the items table"
puts "There are now #{Merchant.count} rows in the merchants table"
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# TODO
# - Import the CSV data into the Items table
# - Add code to reset the primary key sequences on all 6 tables (merchants, items, customers, invoices, invoice_items, transactions)