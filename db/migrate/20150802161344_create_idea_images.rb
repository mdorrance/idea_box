class CreateIdeaImages < ActiveRecord::Migration
  def change
    create_table :idea_images do |t|
      t.references :image, index: true, foreign_key: true, on_delete: :cascade
      t.references :idea, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps null: false
    end
  end
end
