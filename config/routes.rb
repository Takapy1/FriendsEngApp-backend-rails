Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "hello_world", to: 'application#hello_world'

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get '/seasons/:season_id/episodes' => 'episodes#index'
      get '/seasons/:season_id/episodes/:id' => 'episodes#show'
      get '/lines/:line_id/words/:index' => 'words#show'
      
      post '/words' => 'words#create'
    end
  end
end
