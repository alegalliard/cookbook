class RecipeType < ApplicationRecord
  validates :name, presence: {message: 'Você deve informar o nome do tipo de receita'}
  validates :name, uniqueness: { case_sensitive: false, message: 'Tipo de receita já cadastrada' }
  has_many :recipes
end
