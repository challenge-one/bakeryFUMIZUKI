class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :products, through: :cart_items

  has_many :orders
  has_many :addresses

  validates :email, length: {minimum: 3, maximum: 80}
  validates :family_name, length: {minimum: 1, maximum: 15}
  validates :family_name_kana, length: {minimum: 1, maximum: 20}
  validates :first_name, length: {minimum: 1, maximum: 15}
  validates :first_name_kana, length: {minimum: 2, maximum: 20}
  validates :post_code, length: {minimum: 3, maximum: 10}
  validates :address, length: {minimum: 3, maximum: 50}
  validates :tel, length: {minimum: 3, maximum: 15}

  def full_name
    self.family_name + " " + self.first_name
  end
end
