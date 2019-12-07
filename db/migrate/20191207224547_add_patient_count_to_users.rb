class AddPatientCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :patients_count, :integer
  end
end
