class CreateProductCategoriesProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories_products, id: false do |t|
      t.references :product, foreign_key: true
      t.references :product_category, foreign_key: true
      t.timestamps
    end
  end
end
