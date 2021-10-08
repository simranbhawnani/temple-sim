class CreateTemples < ActiveRecord::Migration[6.0]
  def change
    create_table :temples do |t|
      t.string :temple_name
      t.text :description
      t.string :temple_email
      t.string :phone_no
      t.string :temple_address
      t.string :city 
      t.string :state
      t.string :country
      t.integer :zipcode
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
