class CreatePoojas < ActiveRecord::Migration[6.0]
  def change
    create_table :poojas do |t|
      t.string :name
      t.string :type_of_pooja
      t.string :pundit
      t.boolean :status
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
