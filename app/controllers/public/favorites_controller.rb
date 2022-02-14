class Public::FavoritesController < ApplicationController

# いいね機能のコントローラー

# いいね作成
  def create
    manga = Manga.find(params[:manga_id])
    favorite = current_member.favorites.new(manga_id: manga.id)
    favorite.save
    redirect_to manga_path(manga)
  end

# いいね削除（解除）
  def destroy
    manga = Manga.find(params[:manga_id])
    favorite = current_member.favorites.find_by(manga_id: manga.id)
    favorite.destroy
    redirect_to manga_path(manga)
  end
end
