BusTimetable::Application.routes.draw do
  root to: 'stations#index'

  resources :stations, :except => [:new]

  resources :lines, :except => [:new]

  resources :stops, :except => [:new]

  resources :stoptimes, :only => [:create, :destroy]
end
