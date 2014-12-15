class HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:show, :edit, :update, :destroy]

  # GET /hashtags
  # GET /hashtags.json
  def index
    @hashtags = Hashtag.all
  end

  # GET /hashtags/1
  # GET /hashtags/1.json
  def show
    @actors = Actor.find(params[:actor_id])
    @hashtag = Hashtag.find(params[:id])
  end

  # GET /hashtags/new
  def new
    @actors = Actor.find(params[:actor_id])
    @hashtag = Hashtag.new
  end

  # GET /hashtags/1/edit
  def edit
    @actors = Actor.find(params[:actor_id])
    @hashtag = Hashtag.find(params[:id])
  end

  # POST /hashtags
  # POST /hashtags.json
  def create
    @actors = Actor.find(params[:actor_id])
    @hashtag = Hashtag.new(hashtag_params)
    respond_to do |format|
      if @hashtag.save
        format.html { redirect_to @actors, notice: 'Hashtag creado correctamente.' }
        format.json { render :show, status: :created, location: @hashtag }
      else
        format.html { render :new }
        format.json { render json: @hashtag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hashtags/1
  # PATCH/PUT /hashtags/1.json
  def update
    @actors = Actor.find(params[:actor_id])
    @hashtag = Hashtag.find(params[:id])
    respond_to do |format|
      if @hashtag.update(hashtag_params)
        format.html { redirect_to @actors, notice: 'Hashtag actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @hashtag }
      else
        format.html { render :edit }
        format.json { render json: @hashtag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hashtags/1
  # DELETE /hashtags/1.json
  def destroy
    @hashtag.destroy
    respond_to do |format|
      format.html { redirect_to @actors, notice: 'Hashtag eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hashtag
      @actors = Actor.find(params[:actor_id])
      @hashtag = Hashtag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hashtag_params
      params.require(:hashtag).permit(:id_hashtag, :id_actor, :nombre_hashtag)
    end
end
