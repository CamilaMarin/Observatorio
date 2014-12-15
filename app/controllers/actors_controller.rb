class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  # GET /actors
  # GET /actors.json
  def index
    @actors = Actor.all
  end

  # GET /actors/1
  # GET /actors/1.json
  def show
    @actors = Actor.find(params[:id])
    @actor_tweets = ActorTweet.select("*").where(id_actor: @actors.id_actor)
    @hashtags = Hashtag.select("*").where(id_actor: @actors.id_actor)
    @cuentas = Cuentum.select("*").where(id_actor: @actors.id_actor)
    @palabra_claves = PalabraClave.select("*").where(id_actor: @actors.id_actor)
  end 

  # GET /actors/new
  def new
    @actor = Actor.new
  end

  # GET /actors/1/edit
  def edit
  end

  # POST /actors
  # POST /actors.json
  def create
    @actor = Actor.new(actor_params)
    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: 'Actor creado correctamente.' }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :new }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actors/1
  # PATCH/PUT /actors/1.json
  def update
    @actors = Actor.find(params[:id]);
    @actor_tweets = ActorTweet.select("*").where(:id_actor => @actors.id_actor)
    @hashtags = Hashtag.select("*").where(id_actor: @actors.id_actor)
    @cuentas = Cuentum.select("*").where(id_actor: @actors.id_actor)
    @palabra_claves = PalabraClave.select("*").where(id_actor: @actors.id_actor)
    respond_to do |format|
      if @actor.update(actor_params)
        @actor_tweets.update_all(:id_actor => @actors.id_actor)
        @hashtags.update_all(:id_actor => @actors.id_actor)
        @cuentas.update_all(:id_actor => @actors.id_actor)
        @palabra_claves.update_all(:id_actor => @actors.id_actor)
        format.html { redirect_to @actor, notice: 'Actor actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.json
  def destroy
#Si elimino el Actor se elimina los actor_tweet, el tweet y el usuario si este solo tiene este tweet asociado
    @actors = Actor.find(params[:id]);
    @actor_tweets = ActorTweet.select("*").where(:id_actor => @actors.id_actor)
    @hashtags = Hashtag.select("*").where(id_actor: @actors.id_actor)
    @hashtags.each do |hashtag|
      hashtag.destroy
    end
    @cuentas = Cuentum.select("*").where(id_actor: @actors.id_actor)
    @cuentas.each do |cuenta|
      cuenta.destroy
    end
    @palabra_claves = PalabraClave.select("*").where(id_actor: @actors.id_actor)
    @palabra_claves.each do |palabra_clave|
      palabra_clave.destroy
    end
    @actor_tweets.each do |actor_tweet|
      @tweets = Tweet.select("*").where(:id_tweet => actor_tweet.id_tweet)
      @tweets.each do |tweet|
        if Tweet.where(:id_usuario => tweet.id_usuario).count() <2
          @usuario = Usuario.select("*").where(:id_usuario => tweet.id_usuario)
          @usuario.each do |usuario|
            usuario.destroy
          end
        end
        tweet.destroy
      end
      actor_tweet.destroy
    end
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to actors_url, notice: 'Actor eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actor_params
      params.require(:actor).permit(:id_actor, :nombre_actor)
    end
end
