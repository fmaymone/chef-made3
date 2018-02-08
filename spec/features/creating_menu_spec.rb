require 'rails_helper'

RSpec.feature "Criando Menus" do
    scenario "Um usuario cria um novo menu" do
        visit "/"

        click_link "Novo Menu"

        fill_in "Title", with: "Meu Lindo Menu"

        click_button "Criar Menu"

        expect(page).to have_content("Menu Salvo")
        expect(page.current_path).to eq(menus_path)
    end

end