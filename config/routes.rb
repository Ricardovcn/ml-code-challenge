# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :web_api do
    namespace :v1 do
      post '/user', to: 'user_exam#create'
    end
  end
end
