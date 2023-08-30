class PostsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @posts = @article.posts
    @post = Post.new
  end

  def create
    post = Post.new(params.require(:post).permit(:text).merge(article_id: params[:article_id]))
    if post.save
      redirect_to new_article_post_path(params[:article_id])
    else
      render :new, status: :unprocessable_entity
    end
  end
end
