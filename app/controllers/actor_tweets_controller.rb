class ActorTweetsController < ApplicationController
  before_action :set_actor_tweet, only: [:show, :edit, :update, :destroy]

  # GET /actor_tweets
  # GET /actor_tweets.json
  def index
    @actor_tweets = ActorTweet.all
  end

  # GET /actor_tweets/1
  # GET /actor_tweets/1.json
  def show
    @tweet = Tweet.find(params[:tweet_id])
    @actor_tweet = ActorTweet.find(params[:id])
  end

  # GET /actor_tweets/new
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @actor_tweet = ActorTweet.new
  end

  # GET /actor_tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @actor_tweet = ActorTweet.find(params[:id])
  end

  # POST /actor_tweets
  # POST /actor_tweets.json
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @actor_tweet = ActorTweet.new(actor_tweet_params)

    respond_to do |format|
      if @actor_tweet.save
        format.html { redirect_to @tweet, notice: 'Actor tweet creado correctamente.' }
        format.json { render :show, status: :created, location: @actor_tweet }
      else
        format.html { render :new }
        format.json { render json: @actor_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actor_tweets/1
  # PATCH/PUT /actor_tweets/1.json
  def update
    @tweet = Tweet.find(params[:tweet_id])
    @actor_tweet = ActorTweet.find(params[:id])
    respond_to do |format|
      if @actor_tweet.update(actor_tweet_params)
        format.html { redirect_to @tweet, notice: 'Actor tweet actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @actor_tweet }
      else
        format.html { render :edit }
        format.json { render json: @actor_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actor_tweets/1
  # DELETE /actor_tweets/1.json
  def destroy
    @actor_tweet.destroy
    respond_to do |format|
      format.html { redirect_to @tweet, notice: 'Actor tweet eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_tweet
      @tweet = Tweet.find(params[:tweet_id])
      @actor_tweet = ActorTweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actor_tweet_params
      params.require(:actor_tweet).permit(:id_at, :id_actor, :id_tweet)
    end
end
