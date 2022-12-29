Rails.application.routes.draw do
  root to: 'public/homes#top'

  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    resource :end_users
    get '/end_users/mypage' => "end_users#show", as: "mypage"
    get '/end_users/mypage/edit' => "end_users#edit", as: "edit_mypage"
    patch '/end_users/mypage' => "end_users#update", as: "update_mypage"
    get '/end_users/unsubscribe' => "end_users#unsubscribe", as: 'unsubscribe'
    patch '/end_users/withdraw' => "end_users#withdraw", as: 'withdraw'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
