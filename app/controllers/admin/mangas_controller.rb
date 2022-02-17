class Admin::MangasController < ApplicationController
  before_action :authenticate_admin!

  # マンガの紹介＆感想関連コントローラー

  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end
end
