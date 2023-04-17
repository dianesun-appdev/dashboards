class CurrencyController < ApplicationController 

  def get_currency_one
    url = "https://api.exchangerate.host/latest"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @response_obj = JSON.parse(response)

    render({ :template => "/currency/get_currency_one.html.erb" })
  end

  def get_currency_two
    render({ :template => "/currency/get_currency_two.html.erb" })
  end

  def convert
    render({ :template => "/currency/convert.html.erb" })
  end
end
