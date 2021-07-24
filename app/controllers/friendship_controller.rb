class FriendshipController < ApplicationController

  def create
    @friendship = Friendship.new friend_id: params[:user_id], user_id: current_user.id
    p @friendship.save
    redirect_back(fallback_location: root_path)
  end

  def index
    @invitations = current_user.friendships
    @request = Friendship.where('friend_id = ?', current_user.id)
  end

  def update

  end

end
