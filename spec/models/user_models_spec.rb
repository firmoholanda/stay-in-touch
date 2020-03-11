require "rails_helper"

RSpec.describe User, type: :model do
  context 'association tests' do
    it "has many posts" do
      assc = User.reflect_on_association(:posts)
      expect(assc.macro).to eq :has_many
    end

    it "has many comments" do
      assc = User.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it "has many likes" do
      assc = User.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end

    it "has many friendships" do
      assc = User.reflect_on_association(:friendships)
      expect(assc.macro).to eq :has_many
    end

    it "has many inverse friendships" do
      assc = User.reflect_on_association(:inverse_friendships)
      expect(assc.macro).to eq :has_many
    end
  end
end