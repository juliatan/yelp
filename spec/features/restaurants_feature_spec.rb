require 'rails_helper'

describe 'Restaurants listing page' do
  context 'no restaurants' do
    it 'tells me there are no restaurants' do
      visit '/restaurants'
      expect(page).to have_content "There are no restaurants listed"
    end
  end

  context 'are restaurants' do
    before do
      Restaurant.create(name: "Duck and Waffle", cuisine: "European")
    end

    it 'should display restaurants' do
      visit '/restaurants'
      expect(page).to have_content "Duck and Waffle"
    end
  end
end

describe 'Restaurant creation form' do
  
  # context 'logged in' do

  #   context 'If the input is valid' do
  #     it 'should be able to create a restaurant' do
  #       visit '/restaurants/new'
  #       fill_in 'Name', with: 'Duck and Waffle'
  #       fill_in 'Cuisine', with: 'European'
  #       click_button 'Create Restaurant'
  #       expect(current_path).to eq '/restaurants'
  #       expect(page).to have_content 'Duck and Waffle'
  #       expect(page).to have_content 'European'
  #     end
  #   end

  #   context 'If the input is invalid' do
  #     it 'should not be able to create a restaurant' do
  #       visit '/restaurants/new'
  #       fill_in 'Name', with: 'burger king'
  #       fill_in 'Cuisine', with: 'ff'
  #       click_button 'Create Restaurant'
  #       expect(current_path).to eq '/restaurants'
  #       expect(page).not_to have_content 'burger king (ff)'
  #       expect(page).to have_content 'Has to start with capital letter'
  #     end
  #   end

  # end
end

describe 'Restaurant editing and deleting' do
  before { Restaurant.create(name: 'Duck and Waffle', cuisine: 'European') }

  # context 'logged in' do

  #   it 'should be able to edit a restaurant' do
  #     visit '/restaurants'
  #     click_link 'Edit Duck and Waffle'
  #     fill_in 'Name', with: "Ducky"
  #     fill_in 'Cuisine', with: "French"
  #     click_button 'Update Restaurant'
  #     expect(current_path).to eq '/restaurants'
  #     expect(page).to have_content "Ducky (French)"
  #   end

  #   it 'should be able to delete a restaurant' do
  #     visit '/restaurants'
  #     click_link 'Delete Duck and Waffle'
  #     expect(current_path).to eq '/restaurants'
  #     expect(page).not_to have_content "Duck and Waffle (European)"
  #     expect(page).to have_content "Successfully deleted Duck and Waffle"
  #   end

  # end
end
