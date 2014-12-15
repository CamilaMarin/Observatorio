              class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    #Se muestra el tweet y los actor_tweet asociados a este
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.find(params[:id])
    @actor_tweets = ActorTweet.select("*").where(id_tweet: @tweet.id_tweet)
    @textos = Texto.select("*").where(id_tweet: @tweet.id_tweet)
  end

  # GET /tweets/new
  def new
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.new(:id_usuario => @usuario.id_usuario)
  end

  # GET /tweets/1/edit
  def edit
    @usuario = Usuario.find(params[:usuario_id]);
    @tweet = Tweet.find(params[:id]);
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.new(tweet_params, :usuario => @usuario)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @usuario, notice: 'Tweet creado correctamente.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    #Si actualizo el id_tweet se actualizara en todos los actor_tweet asociados a este
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.find(params[:id]);
    @actor_tweets = ActorTweet.select("*").where(:id_tweet => @tweet.id_tweet)
    @textos = Texto.select("*").where(id_tweet: @tweet.id_tweet)
    respond_to do |format|
      if @tweet.update(tweet_params)
        @actor_tweets.update_all(:id_tweet => @tweet.id_tweet)
        @textos.update_all(:id_tweet => @tweet.id_tweet)
        format.html { redirect_to @usuario, notice: 'Tweet actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    #Si se elimina el tweet se eliminan todos los actor_tweet asociados a este
    @usuario = Usuario.find(params[:usuario_id])
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    @actor_tweets = ActorTweet.select("*").where(:id_tweet => @tweet.id_tweet)
    @actor_tweets.each do |actor_tweet|
      actor_tweet.destroy
    end
    @textos = Texto.select("*").where(id_tweet: @tweet.id_tweet)
    @textos.each do |text|
      text.destroy
    end
    respond_to do |format|
      format.html { redirect_to @usuario, notice: 'El tweet se ha eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
       @usuario = Usuario.find(params[:usuario_id])
       @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:id_tweet, :id_texto, :id_usuario, :region, :fecha, :clasificacion)
    end
end
