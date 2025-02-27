Rottenpotatoes::Application.routes.draw do
  devise_for :users
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  # map '/' to be a redirect to '/movies'
  root to: redirect('/movies')
end