Rails.application.routes.draw do
  devise_for :members
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  root 'welcome#index'

  # 文章 show 頁面路徑
  get '@:membername/:story_id', to: 'welcome#show', as: 'story_page'
  # 作者介紹頁面路徑
  get '@:membername', to: 'welcome#member', as: 'member_page'

  resources :stories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
