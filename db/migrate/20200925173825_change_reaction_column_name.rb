class ChangeReactionColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :reactions, :type, :reaction_type
  end
end
