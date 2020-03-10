Rails.application.routes.draw do
  get 'credit_cards/open'
  get 'credit_cards/debit'
  get 'credit_cards/credit'
  get 'credit_cards/close'
  devise_for :members
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  root 'welcome#index'

  # 文章 show 頁面路徑
  get '@:membername/:story_id', to: 'welcome#show', as: 'story_page'
  # 作者介紹頁面路徑
  get '@:membername', to: 'welcome#member', as: 'member_page'

  namespace :api do
    # api 可以加版本
    # namespace :v1 do
      resources :members, only: [] do
        # 跟隨作者
        post :follow, on: :member
      end

      resources :stories, only: [] do
        post :clap, on: :member
        post :bookmark, on: :member
      end
    # end
  end

  resources :stories do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
