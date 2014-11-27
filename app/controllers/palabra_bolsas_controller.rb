class PalabraBolsasController < ApplicationController
  before_action :set_palabra_bolsa, only: [:show, :edit, :update, :destroy]

  # GET /palabra_bolsas
  # GET /palabra_bolsas.json
  def index
    @palabra_bolsas = PalabraBolsa.all
  end

  # GET /palabra_bolsas/1
  # GET /palabra_bolsas/1.json
  def show
  end

  # GET /palabra_bolsas/new
  def new
    @palabra_bolsa = PalabraBolsa.new
  end

  # GET /palabra_bolsas/1/edit
  def edit
  end

  # POST /palabra_bolsas
  # POST /palabra_bolsas.json
  def create
    @palabra_bolsa = PalabraBolsa.new(palabra_bolsa_params)

    respond_to do |format|
      if @palabra_bolsa.save
        format.html { redirect_to @palabra_bolsa, notice: 'Palabra bolsa was successfully created.' }
        format.json { render :show, status: :created, location: @palabra_bolsa }
      else
        format.html { render :new }
        format.json { render json: @palabra_bolsa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /palabra_bolsas/1
  # PATCH/PUT /palabra_bolsas/1.json
  def update
    respond_to do |format|
      if @palabra_bolsa.update(palabra_bolsa_params)
        format.html { redirect_to @palabra_bolsa, notice: 'Palabra bolsa was successfully updated.' }
        format.json { render :show, status: :ok, location: @palabra_bolsa }
      else
        format.html { render :edit }
        format.json { render json: @palabra_bolsa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palabra_bolsas/1
  # DELETE /palabra_bolsas/1.json
  def destroy
    @palabra_bolsa.destroy
    respond_to do |format|
      format.html { redirect_to palabra_bolsas_url, notice: 'Palabra bolsa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_palabra_bolsa
      @palabra_bolsa = PalabraBolsa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def palabra_bolsa_params
      params.require(:palabra_bolsa).permit(:id_palabrab, :nombre_palabra, :puntaje)
    end
end
