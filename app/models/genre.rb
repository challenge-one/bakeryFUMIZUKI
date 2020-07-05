class Genre < ApplicationRecord
  has_many :products
  validates :name, presence: true, length: {maximum:15,minimum:2}
end
