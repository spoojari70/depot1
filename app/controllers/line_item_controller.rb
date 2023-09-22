class LineItem < ApplicationController
  belongs_to :product
  belongs_to :cart
end
