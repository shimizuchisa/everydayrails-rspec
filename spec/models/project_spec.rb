require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @user = User.create(
      first_name: "Joe",
      last_name: "Tester",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
      )

    @user.projects.create(
      name: "Test Project"
      )

    @other_user = User.create(
      first_name: "Mike",
      last_name: "Tester",
      email: "mike@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
      )

    @other_project = @other_user.projects.build(
      name: "Test Project"
      )
  end

  # ユーザー単位では重複したプロジェクト名を許可しないこと
  it "does not allow duplicate projects names per user" do
    new_project = @user.projects.build(
      name: "Test Project"
      )

    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  # 二人のユーザーが同じ名前を使うことは許可すること
  it "allow two users to share a project name 1" do
    expect(@other_project).to be_valid
  end

  it "allow two users to share a project name 2" do
    expect(@other_project).to_not be_valid
  end
end
