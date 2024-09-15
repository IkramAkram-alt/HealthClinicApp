# app/services/patient_import_service.rb
require 'date'
class PatientImportService
  def initialize(file)
    @file = file
  end

  def import_data
    start_time = Time.now
    patients_imported = 0

    CSV.foreach(@file.path, headers: true) do |row|
      patient = Patient.find_or_initialize_by(
        health_identifier: row['health identifier'],
        health_identifier_province: row['health identifier province']
      )

      if patient.new_record?
        patient.update(
          first_name: row['first name'],
          last_name: row['last name'],
          middle_name: row['middle name'],
          email: row['email'],
          phone: row['phone'],
          address1: row['address 1'],
          address2: row['address 2'],
          address_province: row['address province'],
          address_city: row['address city'],
          address_postal_code: row['address postal code'],
          date_of_birth: parse_date(row['date of birth']),
          sex: row['sex']
        )
        patients_imported += 1
      end

      patient.vitals.create(
        vital_type: row['vital_type'],
        measurement: row['measurement'],
        units: row['units']
      ) if row['vital_type'].present?
    end

    end_time = Time.now
    migration_duration = end_time - start_time

    MigrationLog.create!(
      patients_imported: patients_imported,
      migration_duration: migration_duration,
      migration_date: Time.now
    )
  end

  def parse_date(date_string)
    Date.strptime(date_string.strip, '%Y-%m-%d') rescue nil
  end
end
