class Property < ApplicationRecord
  has_one :buyer, dependent: :nullify
  has_many_attached :images

  validates :title, presence: true
  validates :colony_name, presence: true
  validates :plot_number, presence: true
  validates :size, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  enum :status, {
    available: 'available',
    sold: 'sold',
    reserved: 'reserved'
  }

  scope :available, -> { where(status: 'available') }
  scope :sold, -> { where(status: 'sold') }
  scope :reserved, -> { where(status: 'reserved') }
  scope :by_colony, ->(colony) { where(colony_name: colony) }

  def status_color
    case status
    when 'available' then 'success'
    when 'sold' then 'danger'
    when 'reserved' then 'warning'
    else 'secondary'
    end
  end
end
