class RemoveColumnSkillsIdFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :skills_id
  end
end
