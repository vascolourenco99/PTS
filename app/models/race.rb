class Race < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :address, presence: true
  validates :date, presence: true
end
