class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :zipcode
      t.string :contact
      t.string :id_proof
      t.string :proof_id_number
      t.string :role
      t.references :temple, foreign_key: true
    
      t.timestamps
    end
  end
end
