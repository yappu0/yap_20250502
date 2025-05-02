Rails.application.routes.draw do
  devise_for :administrators,
             only: %i[sign_in sign_out session passwords],
             controllers: { sessions: 'admins/sessions' }

  namespace :admins do
    resources :foods
    resources :plans

    root 'foods#index'
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
