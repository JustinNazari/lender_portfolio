class HomeController < ApplicationController
  
  def index
    @user = User.first
  end
  
  def automatic_payments
    @user = User.first
  end

end