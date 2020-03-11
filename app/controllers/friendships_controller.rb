class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    user = User.find(params[:id])
    friendship = current_user.friendships.create(friend_id: user.id, approved: false)
    
    if friendship.save
      flash[:notice] = "friend request was sent."
    else
      flash[:alert] = "friend request failed."
    end
  end

  def index
    @friendships = current_user.friendships
  end

  def update
    active_friend = User.find(params[:id])
    friendship = current_user.inverse_friendships.find_by(user_id: active_friend.id)
    friendship.update(approved: 'true')
    
    if friendship.save
      flash[:notice] = "friend updated."
    else
      flash[:alert] = "friend failed to update."
    end
  end

end