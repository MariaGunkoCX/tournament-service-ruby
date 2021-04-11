Rails.application.routes.draw do
  get 'tournaments/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tournaments do
    member do
      get :statistics
      get 'statistics/scores' => :scores
      get 'statistics/success' => :success
    end
  end

end
