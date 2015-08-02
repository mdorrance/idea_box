class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.references :user, index: true, foreign_key: true, on_delete: :cascade
      t.references :category, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
