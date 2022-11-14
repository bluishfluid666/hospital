class AddForeignKeyFromEmpToDept < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :dept_code, :string, limit: 20
    add_foreign_key :employees, :departments, column: :dept_code, primary_key: "did"
  end
end
