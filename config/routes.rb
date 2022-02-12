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
    resources :mangas
  end

  # 管理者用ログイン機能
  # URL /admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

end
