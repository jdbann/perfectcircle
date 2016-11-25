class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @news = News.all.reverse
  end

  def show
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    @news.user = current_user

    if @news.save
      redirect_to @news, notice: "News was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @news.update(news_params)
      redirect_to @news, notice: "News was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @news.destroy
    redirect_to news_index_url
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :body)
  end
end
