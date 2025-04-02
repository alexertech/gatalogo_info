class GatosController < ApplicationController
  before_action :set_gato, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /gatos
  def index
    @gatos = Gato.all
  end

  # GET /gatos/1
  def show
  end

  # GET /gatos/new
  def new
    @gato = current_user.gatos.build
  end

  # GET /gatos/1/edit
  def edit
  end

  # POST /gatos
  def create
    @gato = current_user.gatos.build(gato_params)

    if @gato.save
      redirect_to gato_url(@gato), notice: "Cat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gatos/1
  def update
    if @gato.update(gato_params)
      redirect_to gato_url(@gato), notice: "Cat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /gatos/1
  def destroy
    @gato.destroy
    redirect_to gatos_url, notice: "Cat was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gato
    @gato = Gato.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gato_params
    params.require(:gato).permit(:name, :breed, :description, :image)
  end

  def correct_user
    @gato = current_user.gatos.find_by(id: params[:id])
    redirect_to gatos_path, notice: "Not authorized to edit this gato" if @gato.nil?
  end
end
