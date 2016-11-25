class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page, notice: "Page was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: "Page was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url
  end

  private

  def set_page
    @page = if params[:permalink]
              Page.find_by_permalink(params[:permalink])
            else
              Page.find(params[:id])
            end
  end

  def page_params
    params.require(:page).permit(:title, :body, :permalink)
  end
end
