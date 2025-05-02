class Order < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :subscription

  scope :latest, -> { order(created_at: :desc, id: :desc) }

  validates :delivery_time_zone, presence: true
  validates :status, presence: true

  enumerize :delivery_time_zone, in: %i[morning afternoon]
  enumerize :status, in: %i[preparing delivered canceled]

  attribute :delivery_time_zone, default: 'morning'
  attribute :status, default: 'preparing'

  class << self
    def delivery!
      Order.where(delivery_on: Date.current, status: 'preparing').find_each do |order|
        order.update!(status: 'delivered')
      end
    end
  end
end
