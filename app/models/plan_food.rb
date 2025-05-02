class PlanFood < ApplicationRecord
  belongs_to :plan
  belongs_to :food

  scope :default_order, -> { order(:id) }

  validates :plan_id, uniqueness: { scope: :food_id }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
