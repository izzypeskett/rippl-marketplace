class ChangeTimeFrameToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :time_frame, :string
  end
end
