class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.datetime :slots_time
      t.integer :availability
      t.integer :booked

      t.timestamps
    end
  end
end
