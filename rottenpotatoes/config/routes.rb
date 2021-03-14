Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  match 'movies/:id/same_director' => 'movies#homo_director', as: :same_director, via: [:get]
end
