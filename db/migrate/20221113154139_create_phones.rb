class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones, id: false do |t|
      t.string :owner_code, limit: 20
      t.string :phone_number, limit: 13
      t.timestamps
    end
    execute "alter table phones add primary key (owner_code, phone_number);"
    add_foreign_key :phones, :employees, column: :owner_code, primary_key: "unique_code" 
  end
end
