require 'rake_helper'

namespace :users do
  desc 'Create a default admin user'
  task create_admin: :environment do
    email = ask 'Email:'
    password = ask 'Password:'
    user = User.new(email: email, password: password, password_confirmation: password)
    user.admin = true
    if user.save
      puts 'Done.  Yay.'
    else
      puts "Save failed because: #{user.errors.full_messages.to_sentence}."
    end
  end
end
