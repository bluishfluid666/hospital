class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers, id: false do |t|
      t.string :pid, limit: 20, null:false
      t.string :name, null: false
      t.string :phone_number, null: false
      t.string :address, limit: 100
      t.timestamps
    end
    execute "alter table providers add primary key (pid);"
  end
end
