class UsersController <  ApplicationController

  def index
    @users = User.all
    @address = Address.all
  end

  def new
    @user = User.new
    @address = Address.all
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:alert] = 'Você deve informar todos os dados do usuário'
      @address = Address.all
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:alert] = 'Você deve informar todos os dados do usuário'
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :name, :cpf, :address_id)
  end
end
