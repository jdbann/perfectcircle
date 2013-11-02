class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /photos
  # GET /photos.json
  # def index
  #   @photos = Photo.all
  # end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photos = @photo.album.photos
    
    unless @photo == @photos.first
      ppi = @photos.index(@photo)
      @previous_photo = @photos[ppi-1]
    end
    
    unless @photo == @photos.last
      ppi = @photos.index(@photo)
      @next_photo = @photos[ppi+1]
    end
  end

  # GET /photos/new
  # def new
  #   @photo = Photo.new
  # end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @album = @photo.album
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to @album }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id], :include => :album)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:album_id, :photo)
    end
end
