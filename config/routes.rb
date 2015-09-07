Rails.application.routes.draw do
  root :to => 'welcome#index'


  namespace :manage do
    resources :issues do
      resources :artice, :except => [:index, :show]
    end
  end
end
