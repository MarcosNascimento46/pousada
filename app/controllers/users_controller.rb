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
      redirect_to @user, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'Usuário removido com sucesso.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :role)
  end

  def authorize_admin
    redirect_to root_path, alert: 'Acesso negado.' unless current_user.admin?
  end
end
