class ChangeLineItemsCartIdToAllowNull < ActiveRecord::Migration[7.0]
  def change
      change_column :line_items, :cart_id, :bigint, null: true
  end
end
