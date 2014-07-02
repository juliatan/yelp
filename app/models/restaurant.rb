class Restaurant < ActiveRecord::Base
  validates :name, :cuisine, presence: true
  validates :name, format: { with: /\A[A-Z]/, message: "Has to start with capital letter" }
  validates :cuisine, length: { minimum: 3 }

  has_many :reviews

  def average_rating
    return "N/A" if reviews.none?
    reviews.average(:rating)
    # more convoluted
    # reviews.inject(0) { |sum, review| (sum + review.rating) / reviews.count }
  end
end
