class RemoveColumnFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :listings, :skills
  end
end
