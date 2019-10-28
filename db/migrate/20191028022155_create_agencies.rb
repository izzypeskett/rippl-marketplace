class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :name
      t.text :description
      t.references :address, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
