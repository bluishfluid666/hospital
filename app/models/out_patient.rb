class OutPatient < ApplicationRecord
  self.primary_key = :prefix, :novem_digit
end
