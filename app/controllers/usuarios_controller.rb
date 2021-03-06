class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
    @tweets = Tweet.select("id , id_usuario, id_tweet , id_texto , region , fecha , clasificacion").where(:id_usuario => @usuario.id_usuario)
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario creado correctamente.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])
    @tweets = Tweet.select("*").where(:id_usuario => @usuario.id_usuario)
    respond_to do |format|
      if @usuario.update(usuario_params) 
        @tweets.update_all(:id_usuario => @usuario.id_usuario)
        format.html { redirect_to @usuario, notice: 'Usuario actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    #Si elimino el Usuario-> se eliminan todos los tweets y los actor_tweet asociados a este
    @usuario = Usuario.find(params[:id])
    @tweets = Tweet.select("*").where(:id_usuario => @usuario.id_usuario)
    @tweets.each do |tweet|
      tweet.destroy
      @actor_tweets = ActorTweet.select("*").where(:id_tweet => tweet.id_tweet)
      @actor_tweets.each do |actor_tweet|
        actor_tweet.destroy
      end
      @textos = Texto.select("*").where(:id_tweet => tweet.id_tweet)
      @textos.each do |text|
       @texto_palabras = TextoPalabra.select("*").where(:id_texto => text.id_texto)
        @texto_palabras.each do |tp|
          tp.destroy
        end
        text.destroy
      end
    end
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario y tweets asociados al usuario eliminados correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:id_usuario, :cuenta)
    end
end
