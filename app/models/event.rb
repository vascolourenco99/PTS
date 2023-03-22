class Event < ApplicationRecord
  has_many :races, dependent: :destroy
  belongs_to :user
  has_one_attached :photo


  validates :name, presence: true
  validates :name, uniqueness: true
end

