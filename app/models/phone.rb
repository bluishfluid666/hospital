class Phone < ApplicationRecord
  self.primary_key = :owner_code, :phone_number
end
