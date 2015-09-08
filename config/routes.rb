Rails.application.routes.draw do
  root :to => 'welcome#index'

  namespace :manage do
    resources :issues, :except => [:index] do
      resources :articles, :except => [:index, :show]
    end
  end
end
