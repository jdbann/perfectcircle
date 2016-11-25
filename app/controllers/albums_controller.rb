class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new
  end

  def edit
    @photo = Photo.new
    @photo.album_id = @album.id
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to @album, notice: "Album was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: "Album was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_url
  end

  private

  def set_album
    @album = Album.find(params[:id], include: :photos)
  end

  def album_params
    params.require(:album).permit(:title, :date, :photo)
  end
end
