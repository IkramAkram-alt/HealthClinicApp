class Vital < ApplicationRecord
  belongs_to :patient

  validates :vital_type, :measurement, :units, presence: true
end
