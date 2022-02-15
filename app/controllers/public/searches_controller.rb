class Public::SearchesController < ApplicationController
  # 検索機能のコントローラー
  def search
    # viewのform_tagにて選択したmodelの値を@modelに代入。
    @model = params[:model]
    # 検索ワードを@contentに代入。
    @content = params[:content]
    # 選択した検索方法の値を@methodに代入。
    @method = params[:method]
    # 選択したモデルがmemberだったら
    if @model == 'member'
      # search_forを@recordsに代入。
      @records = Member.search_for(@content,@method)
      # modelでなかったら
    else
      # search_forを@recordsに代入。
      @records = Manga.search_for(@content,@method)
    end
  end
end
