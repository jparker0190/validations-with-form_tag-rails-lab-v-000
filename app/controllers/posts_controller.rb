class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end


  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
