class Subscription < ApplicationRecord
  FROZEN_SHIPPING_COST = 100

  extend Enumerize

  belongs_to :user
  belongs_to :plan

  has_many :orders, dependent: :destroy

  scope :default_order, -> { order(:id) }

  validates :plan_id, presence: true, uniqueness: { scope: :user_id }
  validates :delivery_frequency, presence: true

  enumerize :delivery_frequency, in: %i[weekly bimonthly]

  accepts_nested_attributes_for :orders, allow_destroy: true, reject_if: :all_blank

  def delivery_frequency_to_days
    case delivery_frequency
    when 'weekly'
      7.days
    when 'bimonthly'
      14.days
    else
      raise ArgumentError, "Invalid delivery frequency: #{delivery_frequency}"
    end
  end

  def total_price
    (plan.foods.where(freezed: true).count * FROZEN_SHIPPING_COST) + plan.price + user.shipping_cost
  end

  def save_with_order
    return false if invalid?

    orders.build(
      user:,
      delivery_on: Date.current + delivery_frequency_to_days,
      status: 'preparing',
      price: total_price
    )

    save
  end
end
