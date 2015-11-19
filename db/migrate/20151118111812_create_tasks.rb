class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.string :name
      t.text :note
      t.string :state
      t.datetime :occured_at
      t.timestamps null: false
    end
  end
end
