require 'rails_helper'

describe 'Deleting a restaurant' do

  context 'logged in' do

    before do 
      @julia = User.create email: 'julia@test.com', password: '12345678', password_confirmation: '12345678'
      @alex = User.create email: 'alex@test.com', password: '12345678', password_confirmation: '12345678'
      @julia.restaurants.create name: 'Duck and Waffle', cuisine: 'European'
      # same as
      # Restaurant.create name: 'Duck and Waffle', cuisine: 'European', user: julia
    end

    context 'as the restaurant owner' do
      it 'should be able to delete the restaurant' do
        login_as @julia
        visit '/restaurants'
        click_link 'Delete Duck and Waffle'
        expect(current_path).to eq '/restaurants'
        expect(page).not_to have_content "Duck and Waffle (European)"
        expect(page).to have_content "Successfully deleted Duck and Waffle"
      end
    end

    context 'not as the restaurant owner' do
      it 'should not be able to delete a restaurant' do
        login_as @alex
        visit '/restaurants'
        click_link 'Delete Duck and Waffle'
        expect(current_path).to eq '/restaurants'
        expect(page).to have_content "Duck and Waffle (European)"
        expect(page).not_to have_content "Successfully deleted Duck and Waffle"
      end
    end

  end

end