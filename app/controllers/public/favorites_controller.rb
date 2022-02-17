class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!
  # いいね機能のコントローラー

  # いいね作成
  def create
    @manga = Manga.find(params[:manga_id])
    favorite = current_member.favorites.new(manga_id: @manga.id)
    favorite.save
    # 非同期化のためredirect_toは削除
  end

  # いいね削除（解除）
  def destroy
    @manga = Manga.find(params[:manga_id])
    favorite = current_member.favorites.find_by(manga_id: @manga.id)
    favorite.destroy
    # 非同期化のためredirect_toは削除
  end
end
