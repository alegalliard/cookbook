require 'rails_helper'

feature 'search recipes' do
  scenario 'search recipe by name and get results'do
    cuisine = Cuisine.create(name: 'Italiana')
    recipe_type = RecipeType.create(name: 'Prato principal')

    recipe = Recipe.create(title: 'Macarronada',
                          recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 40,
                          ingredients: 'macarrao e molho',
                          method: 'joga tudo na agua')

    visit root_path

    fill_in 'Search', with: 'Macarronada'
    click_on 'Buscar'


    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: cuisine.name)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")

  end
end
