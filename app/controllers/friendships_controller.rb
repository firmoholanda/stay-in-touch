class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def index
    @friendships = current_user.friendships
    @inverse_friendships = current_user.inverse_friendships
  end

  def create
    user = User.find(params[:id])
    friendship = current_user.friendships.create(passive_friend_id: user.id, approved: false)

    if friendship.save
      redirect_to request.referrer
      flash[:notice] = "friend request was sent."
    else
      redirect_to :back
      flash[:alert] = "friend request failed."
    end
  end

  def destroy
    active_friend = User.find(params[:id])
    friendship = current_user.inverse_friendships.find_by(active_friend_id: active_friend.id)

    if friendship.destroy
      redirect_to request.referrer
      flash[:notice] = "friend removed."
    else
      redirect_to request.referrer
      flash[:alert] = "friend failed to update."
    end
  end

  def update
    active_friend = User.find(params[:id])
    friendship = current_user.inverse_friendships.find_by(active_friend_id: active_friend.id)
    friendship.update(approved: 'true')

    if friendship.save
      redirect_to request.referrer
      flash[:notice] = "friend updated."
    else
      redirect_to request.referrer
      flash[:alert] = "friend failed to update."
    end
  end

end