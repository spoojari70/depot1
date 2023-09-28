class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(product_id: product.id)
        end
        current_item
    end
    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end
end

# find by () method is a streamlined version of where mehtod. instead of returning an
# array of result it returns an existing line/item or nil
 # has many  tells us that number of items are linked with the cart
 # and depenent destroy is because the existance of the line item is
