require 'rails_helper'

describe 'When writing reviews' do
  
  before { Restaurant.create(name: 'Duck and Waffle', cuisine: 'European') }

  it 'should add reviews to the restaurant page' do
    visit '/restaurants'
    click_link 'Review Duck and Waffle'
    fill_in 'Thoughts', with: "Amazing duck"
    select '5', from: 'Rating'
    click_button 'Create Review'
    expect(page).to have_content 'Amazing duck (5)'
    expect(page).to have_content 'Your review has been added'
  end

end