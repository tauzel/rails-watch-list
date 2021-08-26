class ChangeOverviewNullFalseInMovies < ActiveRecord::Migration[6.0]
  def change
    change_column_null :movies, :overview, false
  end
end
