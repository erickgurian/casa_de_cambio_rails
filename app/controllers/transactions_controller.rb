class TransactionsController < ApplicationController

  def new
    @transaction = Transaction.new
  end


  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      flash[:alert] = 'Você deve informar todos os dados da transação'
      redirect_to action: 'new'
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
      flash[:alert] = 'Você deve informar todos os dados da transação'
      render :edit
    end
  end


  def destroy
    transaction = Transaction.find(params[:id])
    transaction.destroy
    flash[:notice] = 'Transação apagada com sucesso!'
    redirect_to root_path
  end


  private
  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type)
  end

end
