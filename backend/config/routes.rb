Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :vonage_room, only: [:create]
      post 'join_room', to: 'vonage_room#join_room'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
