class ChangeCartIdConstraintInLineItems < ActiveRecord::Migration[6.0]
  def up
      change_column :line_items, :cart_id, :bigint, null: true
  end

  def down
      change_column :line_items, :cart_id, :bigint, null: false
  end
end
