class CreateOfflineCityCentres < ActiveRecord::Migration[6.0]
  def change
    create_table :offline_city_centres do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :pincode
      t.string :mail_id
      t.string :phone_no
      t.timestamps
    end
  end
end
