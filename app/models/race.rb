class Race < ApplicationRecord
  belongs_to :event
  has_one :user, through: :event
  has_many_attached :photos

  validates :name, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validate :validate_photo_count

  def validate_photo_count
    if photos.attached? && photos.count > 4
      errors.add(:photos, "can't be more than 4")
    end
  end

end
