class Recipe < ApplicationRecord
  has_many :ingredients,inverse_of: :recipe, dependent: :destroy
  has_many :directions,inverse_of: :recipe, dependent: :destroy
  has_many :products, through: :ingredients

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  validates :title, :description, presence: true
end
