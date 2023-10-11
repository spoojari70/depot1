class ChangeCartIdConstraintInLineItems < ActiveRecord::Migration[6.0]
  def up
    change_column :line_items, :cart_id, :integer, null: true
  end

  def down
    change_column :line_items, :cart_id, :integer, null: false
  end
end
