Rails.application.routes.draw do

  resources :areas
  resources :submit_requests
  resources :works

  get 'relationships/create'

  get 'relationships/destroy'

 resources :users, only: [:index]

 resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy] do
  collection do
   post :confirm
  end
 end

 if Rails.env.development?
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :tasks do
    resources :messages
        collection do
          post :confirm
    end
  end


 resources :followed_users, only: [:index]
 resources :followers, only: [:index]
 resources :relationships, only: [:create, :destroy]

 
 resources :submit_requests do
   get 'inbox', on: :collection
   member do
     patch 'approve'
     patch 'reject'
   end
 end

 root 'top#index'

end
