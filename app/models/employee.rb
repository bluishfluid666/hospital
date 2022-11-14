class Employee < ApplicationRecord
  self.primary_key = :unique_code
  has_one :department
end
