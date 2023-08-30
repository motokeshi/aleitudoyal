class ArticlesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @reminders = @user.reminders.order(:schedule)
    end
    @articles = Article.order(updated_at: :desc).includes(:user)
  end

  def show
    @article = Article.find(params[:id])
    @posts = @article.posts
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to new_article_post_path(article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:image, :title, :genre_id, :release).merge(user_id: current_user.id)
  end
end
