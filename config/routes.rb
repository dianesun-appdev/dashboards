Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/forex", { :controller => "currency", :action => "get_currency_one" })

  get("/forex/:currency_one", { :controller => "currency", :action => "get_currency_two" })

  get("/forex/:currency_one/:currency_two", { :controller => "currency", :action => "convert" })
end
