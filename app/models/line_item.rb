class LineItem < AppliactionRecord
  belongs_to :product
  belongs_to :cart
end
