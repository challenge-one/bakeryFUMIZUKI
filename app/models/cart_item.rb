class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :product
	validates :customer_id, presence: true
	validates :product_id, presence: true
end
