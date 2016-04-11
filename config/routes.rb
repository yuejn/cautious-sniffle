Rails.application.routes.draw do

  root "contacts#welcome"

  get "/auth/:provider/callback", to: "contacts#authenticate"
  get "/import/:key", to: "contacts#import", as: "import_spreadsheet"

end
