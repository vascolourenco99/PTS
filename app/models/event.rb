class Event < ApplicationRecord
  has_many :races, dependent: :destroy
  # perguntar se meto o user belongs_to :user


  validates :name, presence: true
  validates :name, uniqueness: true
end

