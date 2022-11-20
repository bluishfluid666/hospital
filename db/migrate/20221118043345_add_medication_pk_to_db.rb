class AddMedicationPkToDb < ActiveRecord::Migration[7.0]
  def change
      execute "alter table medications add primary key (mid);"
  end
end
