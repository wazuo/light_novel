class Public::MangaCommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_current_member ,only:[:destroy]
  # 投稿に対するコメントの作成
  def create
    # 投稿するためのマンガのidの習得
    @manga = Manga.find(params[:manga_id])
    # 会員のidの習得とフォームに渡す空のデータの値を設定
    @comment = current_member.manga_comments.new(manga_comment_params)
    # マンガのidを習得
    @comment.manga_id = @manga.id
    @comment.save
    # 非同期化のためredirect_toは削除
    render :index
  end

  # コメント投稿の削除
  def destroy
    # 削除するコメントのidを習得し削除する
    MangaComment.find_by(id:params[:id]).destroy
    @manga = Manga.find(params[:manga_id])
    # 非同期化のためredirect_toは削除
    render :index
  end

  private
  # マンガの感想＆紹介文のコメントのストロングパラメーター
  def manga_comment_params
    params.require(:manga_comment).permit(:comment)
  end

  def ensure_current_member
  @manga = Manga.find(params[:id])
  @comment = @manga.manga_comment
  unless @comment.member == current_member
    flash[:alert] = '権限がありません'
    redirect_to mangas_path
  end
  end
end
