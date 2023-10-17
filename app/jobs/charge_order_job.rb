class ChargeOrderJob < ApplicationJob
  queue_as :default

  def perform(order,pay_type_params)

    order.change!(pay_type_params)
  end
end
