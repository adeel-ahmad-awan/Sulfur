Rails.application.routes.draw do



  resources 'users' do
    resources 'skills'
    resources 'experiences'
  end

  devise_for :users, :controllers => { :registrations => "user/registrations" }

  get 'welcome/index'
  get 'welcome/about'

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
