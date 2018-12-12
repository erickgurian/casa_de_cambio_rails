class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
  end


  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      render :new
    end
  end


  def show
    @transaction = Transaction.find(params[:id])
  end


  def edit
      @transaction = Transaction.find(params[:id])
  end


  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to @transaction 
    else
      render action: :edit
    end
  end


  private
  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type)
  end

end
