class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.text :photo
      t.integer :age
      t.integer :gender
      t.text :resume
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
