class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_id, :integer
    add_column :users, :company_id, :integer
  end
end
