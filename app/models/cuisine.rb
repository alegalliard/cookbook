class Cuisine < ApplicationRecord
  validates :name, presence: {message: 'Você deve informar o nome da cozinha'}
  validates :name, uniqueness: { case_sensitive: false, message: 'Cozinha já cadastrada' }

  has_many :recipes
end
