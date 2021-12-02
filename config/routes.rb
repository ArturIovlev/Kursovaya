Rails.application.routes.draw do
  root 'programs#selection', as: 'home'
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users do
    member do
      get :confirm_email
    end
  end
  get 'mail_stat' => 'programs#mail_stat'
  post 'weight' => 'programs#weight'
  post 'state' => 'programs#state'
  get 'state' => 'programs#state'
  get 'set' => 'settings#set'
  post 'set' => 'settings#set'
  post 'sustain' => 'programs#sustain'
  get 'done' => 'settings#done'
  post 'done' => 'settings#done'
  get 'setting' => 'settings#setting'
  post 'weight_gain' => 'programs#weight_gain'
  post 'stag' => 'programs#stag'
  get 'stag' => 'programs#stag'
  get 'weight_gain' => 'programs#weight_gain'
  get 'sustain' => 'programs#sustain'
  get 'weight_loss' => 'programs#weight_loss'
  get 'show' => 'programs#show'
  post 'show' => 'programs#show'
  post 'training' => 'programs#training'
  get 'training' => 'programs#training'
  resources :programs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
