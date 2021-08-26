class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies, force: :cascade do |t|
      t.string :title, null: false, unique: true
      t.text :overview
      t.string :poster_url
      t.float :rating

      t.timestamps
    end
  end
end
