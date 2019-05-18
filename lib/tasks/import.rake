namespace :import do
  desc "Import users from csv"
  task users: :environment do
    filename = File.join(Rails.root,"users.csv")
    counter = 0
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row| 
# header_converters: :symbol converters -- Email, First Name, Last Name (:email, :first_name,:last_name)  

      # user = User.assign_from_row(row)
      user = User.where(email: row[:email]).first_or_initialize
      user.assign_attributes row.to_hash.slice(:name)

      if user.save
        counter +=1
      else
        puts "#{user.email} #{user.errors.full_message.join(",")}"
      end

    end
  end
end