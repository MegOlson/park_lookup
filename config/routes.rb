Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :states do
        resources :parks
      end
    end
  end
end
