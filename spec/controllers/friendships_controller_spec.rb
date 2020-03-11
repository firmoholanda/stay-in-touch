require "rails_helper"

RSpec.describe FriendshipsController, type: :controller do
  
  before :each do
    @user1 = User.create(name: "user01", email: "example-01@example.com", password: "password", password_confirmation: "password")
    @user2 = User.create(name: "user02", email: "example-02@example.com", password: "password", password_confirmation: "password")
  end

  it "# creates a valid approved_friendship" do    
    approved_friendship = @user1.friendships.create(friend_id: @user2.id, approved: true)
    approved_friendship.approved = true
    expect(approved_friendship).to be_valid
  end

  it "# creates a valid pending_friendship" do
    pending_friendship = @user1.friendships.create(friend_id: @user2.id, approved: false)
    expect(pending_friendship).to be_valid
  end

  it "# creates a invalid friendship" do
    friendship = Friendship.new(friend_id: "", approved: false)
    expect(friendship).to_not be_valid
  end

end
