require 'csv'

class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show edit update destroy]
  def index
    @patients = Patient.all.order(:last_name, :first_name)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: 'Patient was successfully destroyed.'
  end

  def upload
  end

  def process_csv
    file = params[:file]
    return redirect_to root_path, alert: "No file uploaded" unless file

    start_time = Time.now
    csv_headers = CSV.open(file.path, &:readline)

    if csv_headers.include?('vital_type')
      VitalDataImportService.new(file).process
    else
      PatientImportService.new(file).import_data
    end

    @imported_patients_count = Patient.count
    @import_duration = Time.now - start_time

    redirect_to stats_patients_path
  end

  def stats
    @patients_by_province = Patient.group(:address_province).count
    @patients_by_sex = Patient.group(:sex).count
    @patients_by_vital_type = Vital.group(:vital_type).count
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:health_identifier, :first_name, :last_name, :date_of_birth, :sex)
  end
end
