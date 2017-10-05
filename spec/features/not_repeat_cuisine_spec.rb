require 'rails_helper'

feature 'visitor doesnt repeat register cuisine' do
  scenario 'from register cuisine' do

    cuisine = Cuisine.create(name: 'Arabe')

    visit new_cuisine_path
    fill_in 'Nome', with: 'Arabe'
    click_on 'Enviar'

    expect(Cuisine.count).to eq 1
    expect(page).to have_css('li.error', text: 'Cozinha já cadastrada')
  end
end
