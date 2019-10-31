class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.text :title
      t.references :address, foreign_key: true
      t.date :time_frame
      t.integer :no_of_volunteers
      t.references :skills, foreign_key: true
      t.references :agency, foreign_key: true

      t.timestamps
    end
  end
end
