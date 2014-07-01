class Restaurant < ActiveRecord::Base
  has_many :reviews

  def average_rating
    return "N/A" if reviews.none?
    reviews.average(:rating)
    # reviews.inject(0) { |sum, review| (sum + review.rating) / reviews.count }
  end
end
