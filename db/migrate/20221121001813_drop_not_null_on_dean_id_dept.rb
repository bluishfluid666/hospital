class DropNotNullOnDeanIdDept < ActiveRecord::Migration[7.0]
  def change
    execute "alter table departments alter column dean_unique_code drop not null;"
  end
end
