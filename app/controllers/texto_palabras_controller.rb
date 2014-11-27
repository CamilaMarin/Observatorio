class TextoPalabrasController < ApplicationController
  before_action :set_texto_palabra, only: [:show, :edit, :update, :destroy]

  # GET /texto_palabras
  # GET /texto_palabras.json
  def index
    @texto_palabras = TextoPalabra.all
  end

  # GET /texto_palabras/1
  # GET /texto_palabras/1.json
  def show
  end

  # GET /texto_palabras/new
  def new
    @texto_palabra = TextoPalabra.new
  end

  # GET /texto_palabras/1/edit
  def edit
  end

  # POST /texto_palabras
  # POST /texto_palabras.json
  def create
    @texto_palabra = TextoPalabra.new(texto_palabra_params)

    respond_to do |format|
      if @texto_palabra.save
        format.html { redirect_to @texto_palabra, notice: 'Texto palabra was successfully created.' }
        format.json { render :show, status: :created, location: @texto_palabra }
      else
        format.html { render :new }
        format.json { render json: @texto_palabra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texto_palabras/1
  # PATCH/PUT /texto_palabras/1.json
  def update
    respond_to do |format|
      if @texto_palabra.update(texto_palabra_params)
        format.html { redirect_to @texto_palabra, notice: 'Texto palabra was successfully updated.' }
        format.json { render :show, status: :ok, location: @texto_palabra }
      else
        format.html { render :edit }
        format.json { render json: @texto_palabra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texto_palabras/1
  # DELETE /texto_palabras/1.json
  def destroy
    @texto_palabra.destroy
    respond_to do |format|
      format.html { redirect_to texto_palabras_url, notice: 'Texto palabra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_texto_palabra
      @texto_palabra = TextoPalabra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def texto_palabra_params
      params.require(:texto_palabra).permit(:id_tp, :id_texto, :id_palabrab)
    end
end
