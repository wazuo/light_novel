class Public::MangaCommentsController < ApplicationController
  before_action :authenticate_member!
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
    @manga = Manga.find(params[:manga_id])
    @mangacomment = current_member.manga_comments.find_by(id: params[:id])
    @mangacomment.destroy
    # 非同期化のためredirect_toは削除
    render :index
  end

  private

  # マンガの感想＆紹介文のコメントのストロングパラメーター
  def manga_comment_params
    params.require(:manga_comment).permit(:comment)
  end
end
