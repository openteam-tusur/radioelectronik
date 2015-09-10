Rails.application.routes.draw do
  mount ElVfsClient::Engine => '/'

  namespace :manage do
    resources :issues do
      resources :articles, :except => [:index, :show]
    end
    resources :permissions, :except => [:edit, :update]
  end

  resources :users, :only => [] do
    get 'search', :on => :collection
  end

  root :to => 'welcome#index'
end
