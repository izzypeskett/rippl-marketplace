class CreateListingOutcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_outcomes do |t|
      t.string :result

      t.timestamps
    end
  end
end
