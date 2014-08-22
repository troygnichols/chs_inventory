class CreateRegistrationWhitelists < ActiveRecord::Migration
  def change
    create_table :registration_whitelists do |t|

      t.timestamps
    end
  end
end
