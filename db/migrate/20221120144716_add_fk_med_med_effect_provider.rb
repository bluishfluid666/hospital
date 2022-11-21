class AddFkMedMedEffectProvider < ActiveRecord::Migration[7.0]
  def change
    execute "alter table medications add foreign key (provider_number) references providers(pid);"
    execute "alter table medication_effects add foreign key (mid) references medications(mid);"
  end
end
