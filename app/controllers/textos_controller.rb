class TextosController < ApplicationController
  before_action :set_texto, only: [:show, :edit, :update, :destroy]

  # GET /textos
  # GET /textos.json
  def index
    @textos = Texto.all     
  end

  # GET /textos/1
  # GET /textos/1.json
  def show 
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.find(params[:tweet_id])
    @texto = Texto.find(params[:id])
    @texto_palabras = TextoPalabra.select("*").where(id_texto: @texto.id_texto)
  end

  # GET /textos/new
  def new
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.find(params[:tweet_id])
    @texto = Texto.new(:id_tweet => @tweet.id_tweet)
  end

  # GET /textos/1/edit
  def edit
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.find(params[:tweet_id])
    @texto = Texto.find(params[:id])
  end

  # POST /textos
  # POST /textos.json
  def create
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.find(params[:tweet_id])
    @texto = Texto.new(texto_params, :id_tweet => @tweet.id_tweet)
    respond_to do |format|
      if @texto.save
        format.html { redirect_to @tweet, notice: 'Texto was successfully created.' }
        format.json { render :show, status: :created, location: @texto }
      else
        format.html { render :new }
        format.json { render json: @texto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /textos/1
  # PATCH/PUT /textos/1.json
  def update
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.find(params[:tweet_id])
    @texto = Texto.find(params[:id])
    @texto_palabras = TextoPalabra.select("*").where(id_texto: @texto.id_texto)
    respond_to do |format|
      if @texto.update(texto_params)
        @texto_palabras.update_all(:id_texto => @texto.id_texto)
        format.html { redirect_to @tweet, notice: 'Texto was successfully updated.' }
        format.json { render :show, status: :ok, location: @texto }
      else
        format.html { render :edit }
        format.json { render json: @texto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /textos/1
  # DELETE /textos/1.json
  def destroy
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.find(params[:tweet_id])
    @texto = Texto.find(params[:id])
    @texto_palabras = TextoPalabra.select("*").where(id_texto: @texto.id_texto)
    @texto_palabras.each do |texto_palabra|
      texto_palabra.destroy
    end
    @texto.destroy
    respond_to do |format|
      format.html { redirect_to @tweet, notice: 'Texto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_texto
      @usuario = Usuario.find(params[:usuario_id])
      @tweet = Tweet.find(params[:tweet_id])
      @texto = Texto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def texto_params
      params.require(:texto).permit(:id_tweet, :id_texto, :texto)
    end
end
