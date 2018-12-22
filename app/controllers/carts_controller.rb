class CartsController < ApplicationController
  def index
    @cart = Cart.find(params[:id])
  end

  def show
    @cart = Cart.find(params[:id])

    
  end
end