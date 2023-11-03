class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.string :name
        t.references :product_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
