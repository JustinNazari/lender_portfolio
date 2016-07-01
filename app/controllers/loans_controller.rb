class LoansController < ApplicationController
  before_action :select_loan, only: [:show]
  
  def show
    @schedule = @loan.schedule
    @late_payments = @loan.late_payments
    respond_to do |format|
      format.js
    end
  end

private
  def select_loan
    @loan = Loan.find(params[:id])
  end
end