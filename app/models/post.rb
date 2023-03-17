class Post < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :data, presence: true
end
