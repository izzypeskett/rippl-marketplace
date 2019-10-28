class AddIsAgencyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_agency, :boolean, default: false
  end
end
