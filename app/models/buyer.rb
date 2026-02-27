class Buyer < ApplicationRecord
  belongs_to :property

  validates :name, presence: true
  validates :phone, presence: true
  validates :sale_price, presence: true, numericality: { greater_than: 0 }

  scope :recent, -> { order(purchase_date: :desc) }
end
