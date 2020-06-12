class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def send_friend
    Friendship.create(user_id: current_user.id, friend_id: params[:id], confirmed: false)

    redirect_to users_path, notice: 'Friend request sent.'
  end

  def update_friend
    @friendship = Friendship.find(params[:id])
    @friendship.update(confirmed: true)
    @friednship2 = Friendship.create(user_id: current_user.id, friend_id: @friendship.user_id, confirmed: true)
    redirect_back(fallback_location: root_path)
  end

  def destroy_friend
    @friendship = Friendship.find(params[:id])

    # rubocop:disable Layout/LineLength
    @friendship2 = Friendship.where(user_id: @friendship.friend_id, friend_id: @friendship.user_id, confirmed: true).first
    # rubocop:enable Layout/LineLength

    @friendship.destroy
    @friendship2.destroy
    redirect_back(fallback_location: root_path)
  end
end
