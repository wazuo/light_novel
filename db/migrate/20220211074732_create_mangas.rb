class CreateMangas < ActiveRecord::Migration[5.2]
  def change
    create_table :mangas do |t|
      t.integer :member_id
      t.string :title
      t.text :introduction
      t.text :impression
      t.string :image_id
      t.float :review

      t.timestamps
    end
  end
end
