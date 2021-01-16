Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          post :sign_up
          post :sign_in
          post :update_details
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
