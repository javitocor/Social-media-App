class PostsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def friends_posts(user)
    user if friends_check(User.find(user)) || current_user.id == user
  end

  def timeline_posts
    @timeline_posts = Post.all.ordered_by_most_recent.includes(:user).select do |post|
      post.user_id == friends_posts(post.user_id)
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
