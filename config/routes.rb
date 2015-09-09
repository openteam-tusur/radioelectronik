Rails.application.routes.draw do
  root :to => 'welcome#index'

  namespace :manage do
    resources :issues, :except => [:index] do
      resources :articles, :except => [:index, :show]
    end
    resources :permissions, :except => [:edit, :update]
  end

  resources :users, :only => [] do
    get 'search', :on => :collection
  end
end
