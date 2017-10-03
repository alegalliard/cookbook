class Recipe < ApplicationRecord
  validates :title, presence: true
  belongs_to :cuisine
end
