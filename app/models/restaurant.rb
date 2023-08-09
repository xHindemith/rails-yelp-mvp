class Restaurant < ApplicationRecord
  CATEGORIES = %w[chinese italian japanese french belgian].freeze
  validates :category, inclusion: { in: CATEGORIES }
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :category, presence: true
  has_many :reviews, dependent: :destroy
end
