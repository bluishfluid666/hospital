class ModNullExamDiag < ActiveRecord::Migration[7.0]
  def change
    execute "alter table examination_diagnoses alter column diagnosis set not null;"
  end
end
