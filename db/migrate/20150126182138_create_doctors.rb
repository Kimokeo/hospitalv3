class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
    	t.string :name
    	t.string :doctoring_type
    	t.integer :doctoring_id
    	t.integer :patient_id
    	t.integer :hospital_id
      t.timestamps null: false
    end
  end
end
