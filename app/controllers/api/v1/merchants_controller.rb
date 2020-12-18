class Api::V1::MerchantsController < ApplicationController

  def index 
    # require 'pry'; binding.pry
    if params[:item_id]
      item = Item.find(params[:item_id])
      render json: MerchantSerializer.new(item.merchant)
    else
      render json: MerchantSerializer.new(Merchant.all)
    end 
  end
  
  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def create 
    # require 'pry'; binding.pry
    render json: MerchantSerializer.new(Merchant.create(name: merchant_params))
  end

  def update 
    # require 'pry'; binding.pry
    render json: MerchantSerializer.new(Merchant.update(params[:id], {name: merchant_params}))
  end

  def destroy
    Merchant.destroy(params[:id])
  end

  private 

  def merchant_params 
    params.require(:name)
    # params.require(:merchant).permit(:name)
  end
end