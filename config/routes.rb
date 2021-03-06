Rails.application.routes.draw do
  root to: "shops#top_page"
  devise_for :users
  resources :users do
    member do
      get :show_all
      get :show_gone
      get :show_wannago
    end
  end

  resources :shops do
    collection do
      get :yakiniku_rank
      get :washoku_rank
      get :yoshoku_rank
      get :chinese_rank
      get :asian_rank
      get :curry_rank
      get :nabe_rank
      get :izakaya_rank
      get :sousaku_rank
      get :family_rank
      get :lamen_rank
      get :cafe_rank
      get :kissa_rank
      get :sandwich_rank
      get :sweet_rank
      get :bar_rank
    end

    member do
      get :top_page
      get :show_menu
      get :show_reviews
      get :show_map
      get :sort_visit
      get :sort_popular
      get :sort_lunch
      get :sort_dinner
      post 'wannago', to: 'wants#create'
      get 'show_wannago' =>"wants#show_wannago"
    end
    resources :reviews, only: [:new, :create, :edit, :update, :destroy, :show]
  end

  resources :following, only: [:show]
  resources :followers, only: [:show]
  resources :relationships, only: [:create, :destroy]

  post   '/want/:shop_id' => 'wants#want',   as: 'want'
  delete '/want/:shop_id' => 'wants#notwant', as: 'notwant'

  post   '/like/:review_id' => 'likes#like',   as: 'like'
  delete '/like/:review_id' => 'likes#unlike', as: 'unlike'

end
