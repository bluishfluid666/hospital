class ConfirmRecovery < ApplicationRecord
  self.primary_key = :inpatient_prefix, :inpatient_novem_digit
end
