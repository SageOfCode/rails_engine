class Api::V1::Merchants::SearchController < ApplicationController

  def find_all
    merchants = Merchant.where("name like ?", "%" + params[:name].downcase + "%")
    render json: MerchantSerializer.new(merchants)
  end 

  def most_revenue
    merchants = Merchant.find_most_revenue(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end
end 