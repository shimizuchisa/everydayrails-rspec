require 'rails_helper'

# 有効なファクトリを持つこと
describe User do
  # it "has a valid factory" do
  #   expect(FactoryBot.build(:user)).to be_valid
  # end

  # it "is invalid without a first_name" do
  #   user = FactoryBot.build(:user, first_name: nil)
  #   user.valid?
  #   expect(user.errors[:first_name]).to include("can't be blank")
  # end

  # it "returns a user's full name as a string" do
  #   user = FactoryBot.build(:user)
  #   expect(user.name).to eq "Aaron Summer"
  # end

  # it "is invalid with a dualicate email address" do
  #   user = FactoryBot.create(:user, email: "tester@example.com")
  #   other_user = FactoryBot.build(:user, email: "tester@example.com")
  #   other_user.valid?
  #   expect(other_user.errors[:email]).to include("has already been taken")
  # end

  it "has valid sequencd" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    expect(user2.email).to eq "tester2@example.com"
  end

  it "does something with multiple users" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    expect(true).to be_truthy
  end

end

RSpec.describe User, type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であること
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      first_name: "Aaron",
      last_name: "Summer",
      email: "test@test.com",
      password: "password"
      )
    expect(user).to be_valid
  end

  # 名がなければ無効な状態であること
  it "is invalid without a first name" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a first name 2" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to_not include("can't be blank")
  end

  # 姓がなければ無効な状態であること
  it "is invalid without a last name" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without a last_name 2" do
    user =  User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to_not include("can't be blank")
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address 1" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without an email address 2" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to_not include("can't be blank")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      first_name: "Joe",
      last_name: "Tester",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
      )
    user = User.new(
      first_name: "Jane",
      last_name: "Tester",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
      )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  # ユーザーのフルネームを文字列として返すこと
  it "returns a user's full name as a string" do
    user = User.create(
      first_name: "Aaron",
      last_name: "Summer",
      email: "test@test.com",
      password: "password"
      )

    expect(user.name).to eq "Aaron Summer"
  end

end
