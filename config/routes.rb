ApiTemplate::Application.routes.draw do

  namespace :api do
    resources :events
  end

end
