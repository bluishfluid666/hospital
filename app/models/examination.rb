class Examination < ApplicationRecord
  self.primary_key = :date_n_time, :doctor_code, :out_patient_prefix, :out_patient_novem_digit
end
