class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)

     # Run the validations WITHOUT attempting to save to the database, returning
     # true if the Post is valid, and false if it's not.
     if @post.valid?
       # If--and only if--the post is valid, do what we usually do.
       @post.save
       # This returns a status_code of 302, which instructs the browser to
       # perform a NEW REQUEST! (AKA: throw @post away and let the show action
       # worry about re-reading it from the database)
       redirect_to post_path(@post)
     else
       # If the post is invalid, hold on to @post, because it is now full of
       # useful error messages, and re-render the :new page, which knows how
       # to display them alongside the user's entries.
       render :edit
     end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
  def set_post!
    @post = Post.find(params[:id])
  end
end
