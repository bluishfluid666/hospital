class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments, id: false, primary_key: :did do |t|
      t.string :did, null: false, limit: 20
      t.string :title, limit: 30
      t.string :dean_unique_code, limit: 20
      t.timestamps
    end
    add_foreign_key :departments, :employees, column: :dean_unique_code, primary_key: "unique_code"
  end
end
