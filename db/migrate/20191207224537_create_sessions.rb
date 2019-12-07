class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.integer :therapist_id
      t.integer :patient_id
      t.date :date
      t.text :notes
      t.string :price

      t.timestamps
    end
  end
end
