class CreateMangaComments < ActiveRecord::Migration[5.2]
  def change
    create_table :manga_comments do |t|
      t.integer :member_id
      t.integer :manga_id
      t.text :comment

      t.timestamps
    end
  end
end
