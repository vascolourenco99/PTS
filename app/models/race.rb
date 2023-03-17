class Race < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :address, presence: true
  #validates :data, presence: true
  # mudar o tipo de data para string
end
