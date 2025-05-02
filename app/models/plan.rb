class Plan < ApplicationRecord
  has_many :plan_foods, dependent: :destroy
  has_many :subscriptions, dependent: :restrict_with_error

  scope :default_order, -> { order(:id) }

  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :validate_plan_food_presence

  accepts_nested_attributes_for :plan_foods, allow_destroy: true, reject_if: ->(attributes) { attributes[:food_id].blank? }

  private

  def validate_plan_food_presence
    if plan_foods.empty?
      errors.add(:plan_food, '少なくとも1つの以上選択してください')
    end
  end
end
