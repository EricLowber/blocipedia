class StripeController < ApplicationController
   skip_before_filter :verify_authenticity_token, only: :hook

  # def hook
    
  #   pry
  #   render :json => "we good!", :status => :ok
  # end
end
