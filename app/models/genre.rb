class Genre < ApplicationRecord
  has_many :products
  validates :name, presence: true, length: {maximum:15,minimum:2}

  scope :is_valid, -> { where(validity: true) }
end
