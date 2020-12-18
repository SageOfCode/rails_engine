class Api::V1::ItemsController < ApplicationController

  def index 
    # require 'pry'; binding.pry
    if params[:merchant_id]
      items = Item.where(merchant_id: params[:merchant_id])
      render json: ItemSerializer.new(items)
    else
      render json: ItemSerializer.new(Item.all)
    end 
  end

  
  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create 
    render json: ItemSerializer.new(Item.create(item_params))
  end

  def update 
    render json: ItemSerializer.new(Item.update(params[:id], item_params))
  end

  def destroy
    Item.destroy(params[:id])
  end

  private 

  def item_params 
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end