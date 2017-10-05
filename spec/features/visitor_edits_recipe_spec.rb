require 'rails_helper'

feature 'visitor edits recipe' do
  scenario 'from home page' do
    # cria os dados necessarios previamente
    cuisine = Cuisine.create(name: 'Brasileira')
    cuisine2 = Cuisine.create(name: 'Italiana')
    recipe_type = RecipeType.create(name: 'Sobremesa')

    recipe = Recipe.create(title: 'Bolo de chocolate', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Facil',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, chocolate',
                           method: 'Misture os ingrediente e coloque no forno')

    # simula a acao do usuario
    visit root_path
    click_on 'Editar'

    fill_in 'Título', with: 'Bolo de chocolate granulado'
    fill_in 'Tempo de Preparo', with: 45
    select 'Italiana', from: 'Cozinha'
    click_on 'Salvar'

    #resultado da alteracao

    expect(page).to have_css('h1', text: 'Bolo de chocolate granulado')
    expect(page).to have_css('p', text: 'Italiana')
  end

  scenario 'and must fill in all fields' do

    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')

    recipe = Recipe.create(title: 'Bolo de chocolate', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Facil',
                           cook_time: 10,
                           ingredients: 'Farinha, açucar, chocolate',
                           method: 'Misture os ingrediente e coloque no forno')


    visit edit_recipe_path(recipe)
    fill_in 'Título', with: ''
    click_on 'Salvar'


    # expect(page).not_to have_content(recipe.title)
    expect(page).to have_css('div.error', text: 'Não pode haver campos em branco')

  end

end
