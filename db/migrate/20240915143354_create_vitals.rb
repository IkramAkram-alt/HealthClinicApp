class CreateVitals < ActiveRecord::Migration[7.1]
  def change
    create_table :vitals do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :vital_type
      t.float :measurement
      t.string :units

      t.timestamps
    end
  end
end
