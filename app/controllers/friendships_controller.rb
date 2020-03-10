class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    user = User.find(params[:id])
    friendship = curent_user.friendships.create(friend_id: user.id, approved: false)
    if friendship.save
      redirect_to request.referrer, notice: "friend request was sent."
    else
      redirect_to :back, alert: "friend request failed."
    end
  end

  def index
    @friendships = current_user.friendships
  end
end
