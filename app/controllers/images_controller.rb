class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :show
  # GET /images
  # GET /images.json
  def index
        @images = Image.all
        @q = Image.ransack(params[:q])
        @images = @q.result #(distinct: true)
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
       authorize @image unless current_user.has_role? :admin
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    authorize @image
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    authorize @image unless current_user.has_role? :admin
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
     authorize @image unless current_user.has_role? :admin
    @image.destroy
    respond_to do |format|
      if current_user.has_role? :ngo
           format.html { redirect_to ngodashboard_path, notice: 'Image was successfully destroyed.' }
           format.json { head :no_content }
    elsif current_user.has_role? :admin
         format.html { redirect_to admindashboard_path, notice: 'Image was successfully destroyed.' }
         format.json { head :no_content }
    end
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:title, :picture, :picture_cache, :artist_name, :artist_age, :artist_country, :user_id)
    end
end
