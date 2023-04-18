require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @user = User.create(
      first_name: "Baron",
      last_name: "Summer",
      email: "test@uest.com",
      password: "password"
      )

    @project = @user.projects.create(
      name: "Test Project"
      )
  end

  # ユーザー、プロジェクト、メッセージがあれば有効な状態であること
  it "is valid with a user, project and message" do
    note = Note.new(
      message: "This is a sample note.",
      user: @user,
      project: @project,
      )

    expect(note).to be_valid
  end

  # メッセージがなければ無効な状態であること
  it "is invalid without a message" do
    note = Note.new(message: nil)
    note.valid?
    expect(note.errors[:message]).to include("can't be blank")
  end

  # 文字列に一致するメッセージを検索する
  describe "search messages for a term " do
    before do
      @note1 = @project.notes.create(
        message: "This is the first note.",
        user: @user
        )

      @note2 = @project.notes.create(
        message: "This is the second note.",
        user: @user
        )

      @note3 = @project.notes.create(
        message: "First, preheat the oven.",
        user: @user
        )
    end

  # 一致するデータが見つかる時
    context "when a match is faound" do
      # 検索文字列に一致するメモを返すこと
      it "returns notes that match the search term" do
        expect(Note.search("first")).to include(@note1, @note3)
        expect(Note.search("first")).to_not include(@note2)
      end
    end

   # 一致するデータがない時
    context "when no match is faound" do
      # 空のコレクションを返すこと
      it "returns an empty collection when no results are found" do
        expect(Note.search("third")).to be_empty
      end
    end
  end

end
