Rails.application.routes.draw do

  root "contacts#welcome"

  get "/auth/:provider/callback", to: "contacts#import"

end
