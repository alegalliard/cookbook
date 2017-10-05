require 'rails_helper'

feature 'visitor delete a recipe' do
  scenario 'from home page' do

    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')

    recipe = Recipe.create(title: 'Bolo de chocolate', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Facil',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, chocolate',
                           method: 'Misture os ingrediente e coloque no forno')

    visit root_path
    click_on 'Deletar'

    expect(Recipe.count).to eq 0
    expect(page).to have_css('p', text: 'Receita deletada com sucesso')


  end
end
