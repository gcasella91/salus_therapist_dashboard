class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :patient_name
      t.string :patient_email
      t.integer :therapist_id

      t.timestamps
    end
  end
end
