# frozen_string_literal: true

class FriendshipController < ApplicationController
  def create
    @friendship = Friendship.new friend_id: params[:user_id], user_id: current_user.id
    p @friendship.save
    redirect_back(fallback_location: root_path, notice: 'Request Friend')
  end

  def index
    @invitations = current_user.friendships
    @request = Friendship.where('friend_id = ?', current_user.id)
  end

  def accept
    @accept = Friendship.find(params[:user_id])
    p @accept
    if @accept.update(status: 1)
      redirect_back(fallback_location: root_path, notice: 'Friend Added')
    else
      flash.now[:alert] = 'Error while sending message!'
      render root_path
    end
  end

  def reject
    p 'inside the reject'
    redirect_back(fallback_location: root_path)
  end
end
