require "rails_helper"

RSpec.describe Friendship, type: :model do

  context 'Association tests' do
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