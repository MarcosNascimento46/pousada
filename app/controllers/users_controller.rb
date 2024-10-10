class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_out(current_user) if current_user # Logout do usuário atual
      redirect_to root_path, notice: 'Conta criada com sucesso. Faça login com sua nova conta.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def search
    @users = User.where("email LIKE ?", "%#{params[:query]}%")
    render :index
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    sign_out(current_user) if current_user
    redirect_to root_path, notice: 'Conta removida com sucesso.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :role)
  end

  def authorize_admin
    redirect_to root_path, alert: 'Acesso negado.' unless current_user.admin?
  end
end
