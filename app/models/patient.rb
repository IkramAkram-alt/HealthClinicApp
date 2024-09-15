class Patient < ApplicationRecord
  has_many :vitals, dependent: :destroy

  validates :health_identifier, presence: true, uniqueness: { scope: :health_identifier_province }
end
