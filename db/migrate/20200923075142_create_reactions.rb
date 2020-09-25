class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.integer :type
      t.references :comment
      t.references :user

      t.timestamps
    end
  end
end
