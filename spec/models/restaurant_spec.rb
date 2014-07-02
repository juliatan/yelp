require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  
  describe '#average_rating' do
    let(:kfc) { Restaurant.create name: 'KFC', cuisine: 'chicken'}

    it 'returns N/A if there are no reviews' do
      expect(kfc.average_rating).to eq 'N/A'
    end

    context 'with 1 review' do
      it 'returns the rating of that review' do
        # .reviews method available to restaurant instance because defined the
        # association between the two databases in the models files
        kfc.reviews.create(rating: 3)
        expect(kfc.average_rating).to eq 3
      end
    end

    context 'with more than one review' do
      it 'returns the average rating' do
        kfc.reviews.create(rating: 3)
        kfc.reviews.create(rating: 5)
        expect(kfc.average_rating).to eq 4
      end
    end

    context 'where average rating is not a whole number' do
      it 'returns the average as a float' do
        kfc.reviews.create(rating: 2)
        kfc.reviews.create(rating: 3)
        expect(kfc.average_rating).to eq 2.5
      end
    end
  end

  describe '#validity' do
    it 'should have a name' do
      restaurant = Restaurant.new name: nil
      expect(restaurant).not_to be_valid
      # above is more generic statement, below is more specific
      expect(restaurant).to have(2).error_on(:name)
    end

    it 'should have a name with the first letter capitalized' do
      restaurant = Restaurant.new name: 'burger king'
      expect(restaurant).to have(1).error_on(:name)
    end

    it 'should have a cuisine' do
      restaurant = Restaurant.new cuisine: nil
      expect(restaurant).to have(2).error_on(:cuisine)
    end

    it 'should have a cuisine of more than 3 characters' do
      restaurant = Restaurant.new cuisine: 'ff'
      expect(restaurant).to have(1).error_on(:cuisine)
    end
  end
end
