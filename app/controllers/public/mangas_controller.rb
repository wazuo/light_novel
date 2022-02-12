class Public::MangasController < ApplicationController

# マンガの感想＆紹介新規投稿
  def new
    @manga = Manga.new
  end
# マンガの感想＆紹介新規投稿データの保存
  def create
    @manga = Manga.new(manga_params)
    @manga.member_id = current_member.id
    @manga.save
    redirect_to mangas_path
  end

  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end

  def edit
    @manga = Manga.find(params[:id])
  end

  def update
    @manga = Manga.find(params[:id])
    @manga.update(manga_params)
    redirect_to manga_path(@manga)
  end

  def destroy
    @manga = Manga.find(params[:id])
    @manga.destroy
    redirect_to mangas_path
  end

  # マンガの感想や商家の投稿データのストロングパラメーター
  private
  def manga_params
    params.require(:manga).permit(:title,:introduction,:impression,:image)
  end

end
