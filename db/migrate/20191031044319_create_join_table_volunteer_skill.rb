class CreateJoinTableVolunteerSkill < ActiveRecord::Migration[5.2]
  def change
    create_join_table :volunteers, :skills do |t|
      t.index [:volunteer_id, :skill_id]
      t.index [:skill_id, :volunteer_id]
    end
  end
end
