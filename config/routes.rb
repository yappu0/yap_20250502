Rails.application.routes.draw do
  devise_for :users,
             only: %i[sign_in sign_out session passwords registrations],
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations', }
  devise_for :administrators,
             only: %i[sign_in sign_out session passwords],
             controllers: { sessions: 'admins/sessions' }

  resources :subscriptions, only: %i[index show new create]

  namespace :admins do
    resources :foods
    resources :plans
    resources :users, only: %i[index show] do
      scope module: :users do
        resources :subscriptions, only: %i[show]
      end
    end
    root 'foods#index'
  end

  root 'subscriptions#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
