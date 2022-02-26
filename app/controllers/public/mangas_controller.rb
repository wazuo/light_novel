class Public::MangasController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_current_member, only: %i[edit update destroy]
  # マンガの感想＆紹介新規投稿
  def new
    @manga = Manga.new
  end

  # マンガの感想＆紹介新規投稿データの保存
  def create
    @manga = Manga.new(manga_params)
    @manga.member_id = current_member.id
    if @manga.save
      redirect_to manga_path(@manga), notice: '投稿されました'
    else
      render :new
    end
  end

  def index
    @mangas = Manga.page(params[:page]).per(8)
  end

  def show
    @manga = Manga.find(params[:id])
    @manga_comment = MangaComment.new
  end

  def edit
    @manga = Manga.find(params[:id])
  end

  def update
    @manga = Manga.find(params[:id])
    if @manga.update(manga_params)
      redirect_to manga_path(@manga), notice: '更新されました'
    else
      render :edit
    end
  end

  def destroy
    @manga = Manga.find(params[:id])
    @manga.destroy
    redirect_to mangas_path, notice: '削除しました'
  end

  # マンガの感想や商家の投稿データのストロングパラメーター
  private

  def manga_params
    params.require(:manga).permit(:title, :introduction, :impression, :image, :review)
  end
  # "manga" => {"image": ".....", "title": "test",....."review": 3}

  def ensure_current_member
    @manga = Manga.find(params[:id])
    return unless @manga.member != current_member

    flash[:alert] = '権限がありません'
    redirect_to mangas_path
  end
end
