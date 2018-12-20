class HomeController < ApplicationController

  def index
    if params[:currency]
      @transactions = Transaction.where(currency: params[:currency])
    else
      @transactions = Transaction.all.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day)
    end
  end

end
