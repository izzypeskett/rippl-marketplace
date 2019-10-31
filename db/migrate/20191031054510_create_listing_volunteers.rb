class CreateListingVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_volunteers do |t|
      t.references :listing, foreign_key: true
      t.references :volunteer, foreign_key: true
      t.references :listing_outcome, foreign_key: true

      t.timestamps
    end
  end
end
