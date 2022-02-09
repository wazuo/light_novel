Rails.application.routes.draw do

  # 会員用
  # URL /members/sign_in...
  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root to: 'public/homes#top'

  # 管理者用
  # URL /admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

end
