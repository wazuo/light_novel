class Public::SearchesController < ApplicationController
  before_action :authenticate_member!
  # 検索機能のコントローラー
  def search
    # viewのform_tagにて選択したmodelの値を@modelに代入。
    @model = params[:model]
    # 検索ワードを@contentに代入。
    @content = params[:content]
    # 選択した検索方法の値を@methodに代入。
    @method = params[:method]
    # @methodの値を日本語に変換する
    return_japanese
    # 選択したモデルがmemberだったら
    @records = if @model == 'member'
                 # search_forを@recordsに代入。
                 Member.search_for(@content, @method).page(params[:page]).per(8)
               # modelでなかったら
               else
                 # search_forを@recordsに代入。
                 Manga.search_for(@content, @method).page(params[:page]).per(8)
               end
  end

  private

  # 日本語変換の為のアクション
  def return_japanese
    case @method
    when 'perfect'
      @search = '完全一致'
    when 'forward'
      @search = '前方一致'
    when 'backward'
      @search = '後方一致'
    when 'partial'
      @search = '部分一致'
    end
  end
end
