Rails.application.routes.draw do
  get "about-us", to: "about#index"

  root to: "main#index"
end