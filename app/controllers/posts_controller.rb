class PostsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @posts = @article.posts
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to new_article_post_path(params[:article_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to article_path(params[:article_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_post
    @post.destroy
    redirect_to article_path(params[:article_id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :text).merge(article_id: params[:article_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
