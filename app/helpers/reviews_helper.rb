module ReviewsHelper
  # place star_rating method here since it doesn't really have to do with the
  # base logic and is not strictly to do with looks
  def star_rating(rating)
    return rating unless rating.respond_to?(:round)

    rounded_rating = rating.round
    remainder = 5 - rounded_rating
    ('★' * rounded_rating) + ('☆' * remainder)
  end
end
