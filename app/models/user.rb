# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row| 
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
