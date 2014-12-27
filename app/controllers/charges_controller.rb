class ChargesController < ApplicationController
layout "application"
 
  def new
  end

  def create
 
      begin
     
      # Amount in cents
      @amount = 500

     customer = Stripe::Customer.create(
        :email => 'example@stripe.com',
        :card => params[:stripeToken]
        )
     charge = Stripe::Charge.create(
      :customer     => customer.id,
      :amount       => @amount,
      :description  => 'Rails Stripe customer',
      :currency     => 'usd'
      ) 
 
     current_user.update_attribute(:role, "premium_member")

     rescue Stripe::InvalidRequestError => e
     flash[:error] = "You are already a member!"
     redirect_to new_charge_path
   

     rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_charge_path
     end  
  end
end