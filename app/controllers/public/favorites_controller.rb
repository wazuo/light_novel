class Public::FavoritesController < ApplicationController

  def create
    manga = Manga.find(params[:manga_id])
    favorite = current_member.favorites.new(manga_id: manga.id)
    favorite.save
    redirect_to manga_path(manga)
  end

  def destroy
    manga = Manga.find(params[:manga_id])
    favorite = current_member.favorites.find_by(manga_id: manga.id)
    favorite.destroy
    redirect_to manga_path(manga)
  end
end
