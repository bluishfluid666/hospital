class AddNullabilityDept < ActiveRecord::Migration[7.0]
  def change
    execute "alter table departments alter column title set not null"
    execute "alter table departments alter column dean_unique_code set not null"
  end
end
