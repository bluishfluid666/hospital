class AddFkInPatientDiag < ActiveRecord::Migration[7.0]
  def change
    execute "alter table in_patients add foreign key (prefix, novem_digit) references in_patients(prefix, novem_digit);"
  end
end
