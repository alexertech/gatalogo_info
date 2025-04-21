class Admin::GatosController < Admin::BaseController
  before_action :set_gato, only: [:show, :destroy]

  def index
    @gatos = Gato.all.includes(:user, :tags)
  end

  def show
  end

  def destroy
    @gato.destroy
    redirect_to admin_gatos_path, notice: 'Gato eliminado correctamente.'
  end

  private

  def set_gato
    @gato = Gato.find(params[:id])
  end
end