Rails.application.routes.draw do

  root "welcome#index"

  resources :welcome, only: [:index]
  resources :contacts, only: [:index, :show] 

  get "/auth/:provider/callback", to: "contacts#authenticate"
  get "/import/:key", to: "contacts#import", as: "import_spreadsheet"

end
