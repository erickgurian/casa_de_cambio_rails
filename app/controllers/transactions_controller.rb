class TransactionsController < ApplicationController

  def new
    return create if transaction_params

    @transaction = Transaction.new
    @users = User.all
  end


  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      flash[:alert] = 'Você deve informar todos os dados da transação'
      @users = User.all
      render :new
    end
  end


  def show
    @transaction = Transaction.find(params[:id])
  end


  def edit
    return create if transaction_params
    @transaction = Transaction.find(params[:id])
    @users = User.all
  end


  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to @transaction
    else
      flash[:alert] = 'Você deve informar todos os dados da transação'
      @users = User.all
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
    return false if params[:transaction].nil? || params[:transaction].empty?

    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type, :user_id)
  end

end
