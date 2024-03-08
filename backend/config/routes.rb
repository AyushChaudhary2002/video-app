Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :vonage_room, only: [:create]
      get 'join_room', to: 'vonage_room#join_room'
      post 'vonage_archive/start', to: 'vonage_archive#start'
      post 'vonage_archive/stop', to: 'vonage_archive#stop'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
