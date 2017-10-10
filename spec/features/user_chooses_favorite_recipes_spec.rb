require 'rails_helper'

feature 'user set favorite recipes' do
  scenario '' do
    cuisine = Cuisine.create(name: 'Arabe')
    recipe_type = RecipeType.create(name: 'Entrada')

    recipe = Recipe.create(title: 'Tabule',
                          recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Fácil',
                          cook_time: 45,
                          ingredients: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha',
                          method: 'Misturar tudo e servir. Adicione limão a gosto.',
                          favorite: true)

    visit root_path
    click_on 'Enviar uma receita'

    fill_in 'Título', with: 'Tabule'
    select 'Arabe', from: 'Cozinha'
    select 'Entrada', from: 'Tipo da Receita'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a gosto.'
    check 'Favorito'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('p', text: cuisine.name)
    expect(page).to have_css('p', text: recipe.recipe_type.name)
    expect(page).to have_css('p', text: recipe.cuisine.name)
    expect(page).to have_css('p', text: recipe.difficulty)
    expect(page).to have_css('p', text: "#{recipe.cook_time} minutos")
    expect(page).to have_xpath("//img[contains(@src, 'star')]")

  end
end
