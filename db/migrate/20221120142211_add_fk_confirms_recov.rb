class AddFkConfirmsRecov < ActiveRecord::Migration[7.0]
  def change
    execute "alter table confirm_recoveries add foreign key (inpatient_prefix, inpatient_novem_digit) references in_patients(prefix, novem_digit);"
  end
end
