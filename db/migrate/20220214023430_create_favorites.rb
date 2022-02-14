class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :mamber_id
      t.integer :manga_id

      t.timestamps
    end
  end
end
