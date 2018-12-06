Rails.application.routes.draw do
    namespace :api do
    namespace :v1 do
      resources :teams
      resources :cards do
        member do
          get 'add_team/:team_id', to: "cards#add_team"
          get 'rem_team/:team_id', to: "cards#rem_team"
        end
      end
      resources :posts
      resources :lists	
    end
  end

  match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
