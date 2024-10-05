class ReservasController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_funcionario

  def index
    @reservas = Reserva.all
  end

  def show
    @reserva = Reserva.find(params[:id])
  end

  def new
    @reserva = Reserva.new
  end

  def create
    @reserva = Reserva.new(reserva_params)
    if @reserva.save
      redirect_to @reserva, notice: 'Reserva criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    @reserva = Reserva.find(params[:id])
  end

  def update
    @reserva = Reserva.find(params[:id])
    if @reserva.update(reserva_params)
      redirect_to @reserva, notice: 'Reserva atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.destroy
    redirect_to reservas_url, notice: 'Reserva removida com sucesso.'
  end

  private

  def reserva_params
    params.require(:reserva).permit(:check_in, :check_out, :hospede_id, :quarto_id)
  end

  def authorize_funcionario
    redirect_to root_path, alert: 'Acesso negado.' unless current_user.funcionario?
  end
end
