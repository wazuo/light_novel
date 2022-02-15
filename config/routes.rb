Rails.application.routes.draw do

  # 会員用ログイン機能
  # URL /members/sign_in...
  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 会員側のルーティング設定
  root to: 'public/homes#top'
  scope module: 'public' do
    resources :mangas do
      # マンガの紹介＆感想文へのコメント
      resources :manga_comments, only: [:create, :destroy]
      # マンガの紹介＆感想文へのいいね
      resource :favorites, only: [:create, :destroy]
    end
    # マイページなど会員関連
    resources :members,only: [:show, :edit, :update, :index] do
      # フォロー機能
      resource :relationships,only: [:create, :destroy]
      member do
        get :following, :followers
      end
    end
    # 検索のルーティング
    get '/search',to: 'searches#search'
  end

  # 管理者用ログイン機能
  # URL /admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # 管理者側のルーティング設定
  namespace :admin do 
    resources 'members',only: [:index, :show, :edit]
  end

end
