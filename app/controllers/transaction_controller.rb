class TransactionController < ApplicationController

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaciton.new(transaction_params)
    if @transaction.valid?
      @transaction.save
    else
      render :new
    end 
  end


  private
  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type)
  end

end
