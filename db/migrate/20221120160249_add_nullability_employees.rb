class AddNullabilityEmployees < ActiveRecord::Migration[7.0]
  def change
    execute "alter table employees alter column dept_code set not null;"
  end
end
