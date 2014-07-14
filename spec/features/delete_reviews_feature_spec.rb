require 'rails_helper'

describe 'Deleting reviews' do
  context 'when user is not logged in' do
    it 'should not allow user to see delete link' do
      
    end
  end

  context 'when logged in user wrote the review' do
    it 'should allow user to delete the review' do
      
    end
  end

  context 'when logged in user did not write the review' do
    it 'should not allow user to delete the review' do
    
    end
  end
end