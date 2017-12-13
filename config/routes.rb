Rails.application.routes.draw do




  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources 'skills'
  resources 'experiences'
  resources 'educations'
  resources 'services'
  resources 'testimonials'

  get 'welcome/index'
  get 'welcome/about'

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
