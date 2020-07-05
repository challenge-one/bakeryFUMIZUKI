class Address < ApplicationRecord
	belongs_to :customer

	validates :post_code, presence: true, length: {minimum: 2, maximum: 10}
	validates :addressee, presence: true, length: {minimum: 2, maximum: 35}
	validates :address, presence: true, length: {minimum: 2, maximum: 50}
end
