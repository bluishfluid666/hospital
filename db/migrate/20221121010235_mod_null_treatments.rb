class ModNullTreatments < ActiveRecord::Migration[7.0]
  def change
    execute "alter table treatments alter column start_datetime set not null;"
    execute "alter table treatments alter column end_datetime set not null;"
  end
end
