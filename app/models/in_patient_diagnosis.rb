class InPatientDiagnosis < ApplicationRecord
  self.primary_key = :prefix, :novem_digit, :diagnosis
  belongs_to :in_patients, foreign_key: "prefix"
  belongs_to :in_patients, foreign_key: "novem_digit"
end
