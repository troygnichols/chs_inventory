class CreateRegistrationWhitelist < ActiveRecord::Migration
  def change
    create_table :registration_whitelists do |t|
      t.string :email, null: false
    end
  end
end
