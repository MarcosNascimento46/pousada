class HospedesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_hospede, only: [:show, :edit, :update, :destroy]

  def index
    @hospedes = Hospede.all
  end

  def show
  end

  def new
    @hospede = Hospede.new
  end

  def create
    @hospede = Hospede.new(hospede_params)

    respond_to do |format|
      if @hospede.save
        format.html { redirect_to hospede_url(@hospede), notice: "Hospede criado com sucesso." }
        format.json { render :show, status: :created, location: @hospede }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hospede.errors, status: :unprocessable_entity }
      end
    end  # end do respond_to

  end  # end create

  def edit
  end

  def search
    @hospedes = Hospede.where("nome LIKE ?", "%#{params[:q]}%")
    render :index
  end

  def update
    if @hospede.update(hospede_params)
      redirect_to @hospede, notice: 'Hóspede atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @hospede.destroy
    redirect_to hospedes_url, notice: 'Hóspede removido com sucesso.'
  end

  private

  def set_hospede
    @hospede = Hospede.find(params[:id])
  end

  def hospede_params
    params.require(:hospede).permit(:nome, :documento, :email, :telefone)
  end

  def authorize_admin
    redirect_to root_path, alert: 'Acesso negado.' unless current_user.admin?
  end
end
