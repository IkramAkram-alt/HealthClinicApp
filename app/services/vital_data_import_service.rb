class VitalDataImportService
  def initialize(file)
    @file = file
  end

  def process
    CSV.foreach(@file.path, headers: true) do |row|
      patient = Patient.find_by(
        health_identifier: row['health identifier'],
        health_identifier_province: row['health identifier province']
      )
      next unless patient

      patient.vitals.create(
        vital_type: row['vital_type'],
        measurement: row['measurement'],
        units: row['units']
      )
    end
  end
end
