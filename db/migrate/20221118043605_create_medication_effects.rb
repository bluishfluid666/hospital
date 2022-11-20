class CreateMedicationEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :medication_effects, id: false do |t|
      t.string :mid, limit: 20
      t.string :effect
      t.timestamps
    end
    execute "ALTER TABLE medication_effects ADD PRIMARY KEY (mid, effect);"
  end
end
