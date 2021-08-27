class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  # RAKE incompatible
  # validates :rating, numericality: true

  def self.remaining
    # Returns an Array w/ the movies not yet bookmarked
    picked_movies_id = []
    Bookmark.all.each do |bookmark|
      picked_movies_id << bookmark.movie_id
    end
    Movie.all.reject{ |movie| picked_movies_id.include?(movie.id) }
  end
end
