class Food < ApplicationRecord
  scope :default_order, -> { order(:id) }

  validates :name, presence: true
end
