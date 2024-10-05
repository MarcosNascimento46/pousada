class QuartosController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @quartos = Quarto.all
  end

  def show
    @quarto = Quarto.find(params[:id])
  end

  def new
    @quarto = Quarto.new
  end

  def create
    @quarto = Quarto.new(quarto_params)
    if @quarto.save
      redirect_to @quarto, notice: 'Quarto criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @quarto = Quarto.find(params[:id])
  end

  def update
    @quarto = Quarto.find(params[:id])
    if @quarto.update(quarto_params)
      redirect_to @quarto, notice: 'Quarto atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @quarto = Quarto.find(params[:id])
    @quarto.destroy
    redirect_to quartos_url, notice: 'Quarto removido com sucesso.'
  end

  private

  def quarto_params
    params.require(:quarto).permit(:numero, :tipo, :descricao)
  end

  def authorize_admin
    redirect_to root_path, alert: 'Acesso negado.' unless current_user.admin?
  end
end
