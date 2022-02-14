class Public::MangaCommentsController < ApplicationController

# 投稿に対するコメントの作成
  def create
    # 投稿するためのマンガのidの習得
    manga = Manga.find(params[:manga_id])
    # 会員のidの習得とフォームに渡す空のデータの値を設定
    comment = current_member.manga_comments.new(manga_comment_params)
    # マンガのidを習得
    comment.manga_id = manga.id
    comment.save
    redirect_to request.referer
  end

  # コメント投稿の削除
  def destroy
    # 削除するコメントのidを習得し削除する
    MangaComment.find_by(id:params[:id]).destroy
    redirect_to request.referer
  end

  private

  def manga_comment_params
    params.require(:manga_comment).permit(:comment)
  end

end
