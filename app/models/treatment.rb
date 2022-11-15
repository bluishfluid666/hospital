class Treatment < ApplicationRecord
  self.primary_key = :start_datetime, :end_datetime, :doctor_code, :inpatient_prefix, :inpatient_novem_digit
end
