Rails.application.routes.draw do
  devise_for :users
  
  root "dashboard#index"

  resources :properties

  resources :buyers

  get "dashboard", to: "dashboard#index", as: :dashboard
  get "colony_map", to: "colony_map#index", as: :colony_map
  get "colony_map/:colony_name", to: "colony_map#show", as: :colony_map_show

  # AI Generator pages
  get "ai_generator/description", to: "ai_generator#description", as: :ai_generator_description
  get "ai_generator/social_post", to: "ai_generator#social_post", as: :ai_generator_social_post

  # AI Generator actions
  post "ai_generator/generate_description/:property_id", to: "ai_generator#generate_description", as: :ai_generate_description
  post "ai_generator/generate_social_post/:property_id", to: "ai_generator#generate_social_post", as: :ai_generate_social_post

  get "up" => "rails/health#show", as: :rails_health_check
end
