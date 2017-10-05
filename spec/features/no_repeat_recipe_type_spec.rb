require 'rails_helper'

feature 'visitor doesnt repeat register recipe type' do
  scenario 'from register recipe type' do

    recipe_type = RecipeType.create(name: 'Sobremesa')

    visit new_recipe_type_path
    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    expect(RecipeType.count).to eq 1
    expect(page).to have_css('li.error', text: 'Tipo de receita já cadastrada')
  end
end
