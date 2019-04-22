require "csv"
namespace :import do
  desc "Import users from csv"
  task users: :environment do
    filename = File.join(Rails.root,"users.csv")
    # CSV.foreach(filename, headers: true) do |row| --for csv's with header (use row["Email"])
    CSV.foreach(filename) do |row|
      name, email = row
      User.create(name: name, email: email)
      puts row.inspect
    end
  end
end