Rails.application.routes.draw do

  root "contacts#welcome"

  get "/list", to: "contacts#list"
  get "/contact/:id", to: "contacts#show", as: "contact"

  get "/auth/:provider/callback", to: "contacts#authenticate"
  get "/import/:key", to: "contacts#import", as: "import_spreadsheet"

end
