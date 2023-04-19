require 'rails_helper'

RSpec.describe Project, type: :model do
#クラスの継承を使用、トレイルなし
  # 締切日が過ぎていれば遅延していること
  # it "is late when the due date is past today" do
  #   project = FactoryBot.create(:project_due_yesterday)
  #   expect(project).to be_late
  # end

  # #締切日が今日ならスケジュール通りであること
  # it "is on time when the due date is today" do
  #   project = FactoryBot.create(:project_due_today)
  #   expect(project).to_not be_late
  # end

  # it "is on time when the due date is in the future" do
  #   project = FactoryBot.create(:project_due_tomorrow)
  #   expect(project).to_not  be_late
  # end

#クラスの継承を使用、トレイル使用
  # 締切日が過ぎていれば遅延していること
  # it "is late when the due date is past today" do
  #   project = FactoryBot.create(:project, :due_yesterday)
  #   expect(project).to be_late
  # end

  # #締切日が今日ならスケジュール通りであること
  # it "is on time when the due date is today" do
  #   project = FactoryBot.create(:project, :due_today)
  #   expect(project).to_not be_late
  # end

  # it "is on time when the due date is in the future" do
  #   project = FactoryBot.create(:project, :due_tomorrow)
  #   expect(project).to_not  be_late
  # end

  # #たくさんのメモが付いていること
  # it "can have many notes" do
  #   project = FactoryBot.create(:project)
  #   expect(project.notes.length).to eq 5
  # end

  # it "has 5 notes" do
  #   project = FactoryBot.create(:project, :with_notes)
  #   expect(project.notes.length).to eq 5
  # end

  # before do
  #   @user = User.create(
  #     first_name: "Joe",
  #     last_name: "Tester",
  #     email: "tester@example.com",
  #     password: "dottle-nouveau-pavilion-tights-furze"
  #     )

  #   @user.projects.create(
  #     name: "Test Project"
  #     )

  #   @other_user = User.create(
  #     first_name: "Mike",
  #     last_name: "Tester",
  #     email: "mike@example.com",
  #     password: "dottle-nouveau-pavilion-tights-furze"
  #     )

  #   @other_project = @other_user.projects.build(
  #     name: "Test Project"
  #     )
  # end

  # # ユーザー単位では重複したプロジェクト名を許可しないこと
  # it "does not allow duplicate projects names per user" do
  #   new_project = @user.projects.build(
  #     name: "Test Project"
  #     )

  #   new_project.valid?
  #   expect(new_project.errors[:name]).to include("has already been taken")
  # end

  # # 二人のユーザーが同じ名前を使うことは許可すること
  # it "allow two users to share a project name 1" do
  #   expect(@other_project).to be_valid
  # end

  # it "allow two users to share a project name 2" do
  #   expect(@other_project).to_not be_valid
  # end
end