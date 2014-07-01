require 'rails_helper'

def leave_rating(thoughts, rating)
  visit '/restaurants'
  click_link 'Review Duck and Waffle'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Create Review'
end

describe 'When writing reviews' do
  
  before { Restaurant.create(name: 'Duck and Waffle', cuisine: 'European') }

  it 'should add reviews to the restaurant page' do
    leave_rating("Amazing duck", 5)
    expect(page).to have_content 'Amazing duck (5)'
    expect(page).to have_content 'Your review has been added'
  end
end

describe 'Average ratings' do

  before { Restaurant.create(name: 'Duck and Waffle', cuisine: 'European') }

  it 'calculates and displays average rating' do
    leave_rating('Poor', 2)
    leave_rating('Great', 4)
    expect(page).to have_content 'Average rating: ★★★☆☆'
  end
end