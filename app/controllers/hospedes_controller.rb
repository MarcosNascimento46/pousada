class HospedesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hospede, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @hospedes = Hospede.all
    authorize @hospedes
  end

  def show
    authorize @hospede
  end

  def new
    @hospede = Hospede.new
    authorize @hospede
  end

  def create
    @hospede = Hospede.new(hospede_params)
    authorize @hospede
    if @hospede.save
      redirect_to @hospede, notice: 'Hóspede criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    authorize @hospede
  end

  def update
    authorize @hospede
    if @hospede.update(hospede_params)
      redirect_to @hospede, notice: 'Hóspede atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    authorize @hospede
    @hospede.destroy
    redirect_to hospedes_url, notice: 'Hóspede removido com sucesso.'
  end

  private

  def set_hospede
    @hospede = Hospede.find(params[:id])
  end

  def hospede_params
    params.require(:hospede).permit(:nome, :documento, :email, :telefone) # Adicione os parâmetros necessários
  end
end
