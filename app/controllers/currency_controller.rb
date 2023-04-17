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

    url = "https://api.exchangerate.host/convert?from=#{@original_currency}&to=#{@new_currency}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)

    @rate = response_obj["info"]["rate"]

    render({ :template => "/currency/convert.html.erb" })
  end
end
