class FuncionariosController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @funcionarios = Funcionario.all
  end

  def show
    @funcionario = Funcionario.find(params[:id])
  end

  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    if @funcionario.save
      redirect_to @funcionario, notice: 'Funcionário criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @funcionario = Funcionario.find(params[:id])
  end

  def update
    @funcionario = Funcionario.find(params[:id])
    if @funcionario.update(funcionario_params)
      redirect_to @funcionario, notice: 'Funcionário atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @funcionario = Funcionario.find(params[:id])
    @funcionario.destroy
    redirect_to funcionarios_url, notice: 'Funcionário removido com sucesso.'
  end

  private

  def funcionario_params
    params.require(:funcionario).permit(:nome, :cargo, :data_contratacao)
  end

  def authorize_admin
    redirect_to root_path, alert: 'Acesso negado.' unless current_user.admin?
  end
end
