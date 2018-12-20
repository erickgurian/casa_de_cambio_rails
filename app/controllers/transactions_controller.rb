class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
    @users = User.all
  end


  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      @users = User.all
      render :new
    end
  end


  def show
    @transaction = Transaction.find(params[:id])
  end


  def edit
    @transaction = Transaction.find(params[:id])
    @users = User.all
  end


  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to @transaction
    else
      @users = User.all
      render :edit
    end
  end


  def destroy
    transaction = Transaction.find(params[:id])
    transaction.destroy
    flash[:notice] = 'Transação apagada com sucesso!'
    redirect_to root_path (flash[:notice])
  end


  private
  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type, :user_id)
  end

end
