class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # validates that a Movie can only be saved in 1 list
  validates :movie_id, uniqueness: { scope: :list_id }
end
