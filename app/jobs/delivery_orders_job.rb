class DeliveryOrdersJob < ApplicationJob
  queue_as :default

  def perform
    Order.delivery!
  end
end
