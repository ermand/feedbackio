class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :state

      t.timestamps null: false
    end
    add_index :profiles, :state
  end
end
