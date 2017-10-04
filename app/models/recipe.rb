class Recipe < ApplicationRecord
  validates :title, presence: true
  #validates_associated :cuisine
  #validates :recipe_type, presence: true
  # validates :cuisine_id, presence: true
  # validates :difficulty, presence: true
  # validates :cook_time, presence: true
  # validates :ingredients, presence: true
  # validates :method presence: true

  belongs_to :cuisine
  belongs_to :recipe_type
end
