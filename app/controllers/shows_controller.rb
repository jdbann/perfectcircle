class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @shows = []
    @past_shows = []
    Show.all.order(expiry_date: :desc).each do |show|
      if show.expiry_date >= DateTime.now
        @shows << show
      else
        @past_shows << show
      end
    end
  end

  def show
  end

  def new
    @show = Show.new
  end

  def edit
  end

  def create
    @show = Show.new(show_params)

    if @show.save
      redirect_to @show, notice: "Show was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @show.update(show_params)
      redirect_to @show, notice: "Show was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url }
      format.json { head :no_content }
    end
  end

  private

  def set_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(
      :title, :author, :body, :expiry_date, :extended, :author_date
    )
  end
end
