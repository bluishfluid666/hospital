class Department < ApplicationRecord
  self.primary_key = :did
  belongs_to :dean, class: 'Employee', foreign_key: 'dean_unique_code', required: true
end
