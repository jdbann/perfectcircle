class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show

  def show
    @photos = @photo.album.photos

    unless @photo == @photos.first
      ppi = @photos.index(@photo)
      @previous_photo = @photos[ppi - 1]
    end

    unless @photo == @photos.last
      ppi = @photos.index(@photo)
      @next_photo = @photos[ppi + 1]
    end
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo, notice: "Photo was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Photo was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @album = @photo.album
    @photo.destroy
    redirect_to @album
  end

  private

  def set_photo
    @photo = Photo.find(params[:id], include: :album)
  end

  def photo_params
    params.require(:photo).permit(:album_id, :photo)
  end
end
