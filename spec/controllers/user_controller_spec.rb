require "rails_helper"

RSpec.describe UsersController, type: :controller do

  it "validates create user is correct" do
    user = User.create(name: "user01", email: "example-01@example.com", password: "password", password_confirmation: "password")
    expect(user.valid?).to be(true)
  end

  it "validates name have mora than 50 chars" do
    user = User.new(name: "x" * 55)
    expect(user.valid?).to be(false)
  end

  it "validates name email and password" do
    user = User.new(name: "", email: "", password: "")
    expect(user.valid?).to be(false)
  end

end
