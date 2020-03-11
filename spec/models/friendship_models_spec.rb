require "rails_helper"

RSpec.describe Friendship, type: :model do

  let(:user) { FactoryBot.create :user }
  let(:friend) { FactoryBot.create :user }

  it 'should set approved = false by default' do
    friendship = user.friendships.create(friend_id: user.id, approved: false)

    expect(friendship.approved).to be false
  end

  context 'association tests' do
    describe 'friendship model associations' do
      it 'belongs to sender' do
        assc = Friendship.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
      it 'belongs to reciever' do
        assc = Friendship.reflect_on_association(:friend)
        expect(assc.macro).to eq :belongs_to
      end
    end
  end

end