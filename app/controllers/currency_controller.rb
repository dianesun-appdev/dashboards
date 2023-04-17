class CurrencyController < ApplicationController
  def get_currency_one
    render({ :template => "/currency/get_currency_one.html.erb" })
  end

  def get_currency_two
    @original_currency = params[:currency_one]

    render({ :template => "/currency/get_currency_two.html.erb" })
  end

  def convert
    @original_currency = params[:currency_one]
    @new_currency = params[:currency_two]

    url = "https://api.exchangerate.host/latest"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @response_obj = JSON.parse(response)

    render({ :template => "/currency/convert.html.erb" })
  end
end
