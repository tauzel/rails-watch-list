class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # validates that is unique for a given list/movie couple
  validates :movie_id, uniqueness: { scope: :list_id }
end
