class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists, force: :cascade do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
