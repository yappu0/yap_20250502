class Food < ApplicationRecord
  has_many :plan_foods, dependent: :destroy

  scope :default_order, -> { order(:id) }

  validates :name, presence: true
end
