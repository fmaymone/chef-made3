class CheckoutController < ApplicationController
  def create
    checkout = Checkout.process(checkout_params)
    respond_with checkout, location: -> { order_path(checkout.order_id) }
  end

  private

  def checkout_params
    params
      .require(:checkout)
      .permit(:number_of_subscriptions, :payment_method, :name, :email, :tos)
  end
end
