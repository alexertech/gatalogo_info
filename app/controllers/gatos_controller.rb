class GatosController < ApplicationController
  before_action :set_gato, only: %i[ show edit update destroy ]

  # GET /gatos or /gatos.json
  def index
    @gatos = Gato.all
  end

  # GET /gatos/1 or /gatos/1.json
  def show
  end

  # GET /gatos/new
  def new
    @gato = Gato.new
  end

  # GET /gatos/1/edit
  def edit
  end

  # POST /gatos or /gatos.json
  def create
    @gato = Gato.new(gato_params)

    respond_to do |format|
      if @gato.save
        format.html { redirect_to @gato, notice: "Gato was successfully created." }
        format.json { render :show, status: :created, location: @gato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gatos/1 or /gatos/1.json
  def update
    respond_to do |format|
      if @gato.update(gato_params)
        format.html { redirect_to @gato, notice: "Gato was successfully updated." }
        format.json { render :show, status: :ok, location: @gato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gatos/1 or /gatos/1.json
  def destroy
    @gato.destroy!

    respond_to do |format|
      format.html { redirect_to gatos_path, status: :see_other, notice: "Gato was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gato
      @gato = Gato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gato_params
      params.require(:gato).permit(:name, :breed, :description, :image, :user_id)
    end
end
