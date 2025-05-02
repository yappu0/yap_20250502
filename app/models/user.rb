class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions, dependent: :restrict_with_error

  scope :default_order, -> { order(:id) }

  validates :name, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  def shipping_cost
    prefecture_name = JpPrefecture::Prefecture.find(prefecture.to_i).name
    case prefecture_name
    when '北海道', '沖縄'
      800
    else
      500
    end
  end
end
