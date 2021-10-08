class CreateDevoters < ActiveRecord::Migration[6.0]
  def change
    create_table :devoters do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :zipcode
      t.string :mail_id
      t.string :contact
      t.string :id_proof
      t.string :proof_id_number

      t.timestamps
    end
  end
end
