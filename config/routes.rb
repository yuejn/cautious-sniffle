Rails.application.routes.draw do

  root "contacts#index"

  get "/book", to: "contacts#book"
  get "/auth/:provider/callback", to: "contacts#authenticate"
  get "/import/:key", to: "contacts#import", as: "import_spreadsheet"

end
