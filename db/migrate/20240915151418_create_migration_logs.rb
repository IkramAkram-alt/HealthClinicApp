class CreateMigrationLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :migration_logs do |t|
      t.integer :patients_imported
      t.float :migration_duration
      t.datetime :migration_date

      t.timestamps
    end
  end
end
