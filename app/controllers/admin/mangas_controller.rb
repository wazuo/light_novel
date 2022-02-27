class Admin::MangasController < ApplicationController
  before_action :authenticate_admin!

  # マンガの紹介＆感想関連コントローラー

  def index
    @mangas = Manga.page(params[:page]).per(8)
  end

  def show
    @manga = Manga.find(params[:id])
  end

  def destroy
    @manga = Manga.find(params[:id])
    @manga.destroy
    redirect_to admin_mangas_path, notice: '削除しました'
  end
end
