class ArticlesController < ApplicationController
  def index
    @articles = Article.articles_search(params[:keyword]).order(updated_at: :desc).includes(:user).with_attached_image
  end

  def show
    @article = Article.find(params[:id])
    @posts = @article.posts.with_attached_image
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
    @reminders = @article.reminders.with_attached_image
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

  def destroy
    article_set
    @article.destroy
    redirect_to root_path
  end

  def search
    article_set
    @reminders = Reminder.reminders_search(current_user.id, params[:keyword])
  end

  def relation
    reminder_article = ReminderArticle.new(reminder_id: params[:article_id], article_id: params[:id])
    reminder_article.save
    redirect_to article_path(params[:id])
  end

  def cancellation
    reminder_article = ReminderArticle.find_by(reminder_id: params[:format], article_id: params[:id])
    reminder_article.destroy
    redirect_to article_path(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:image, :title, :genre_id, :release).merge(user_id: current_user.id)
  end

  def article_set
    @article = Article.find(params[:id])
  end
end
