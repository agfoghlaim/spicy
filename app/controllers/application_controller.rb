class ApplicationController < ActionController::Base
  helper_method :current_cart
  def current_cart
    #does a cart already exist? - use session var to find out
  
    #find either returns the cart or raises ActiveRecord::RecordNotFound exception so

    #first check if it exists, exists returns bool
    if(Cart.exists?(session[:cart_id]))
      #it exists, so find it (this doesn't seem like the most efficient way of doing this)
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    return @cart

  end
  
end
