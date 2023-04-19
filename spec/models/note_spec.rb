require 'rails_helper'

RSpec.describe Note, type: :model do
  # ファクトリで関連するデータを生成する
  # it "generates associated date from a factory" do
  #   note = FactoryBot.create(:note)
  #   puts note.project.inspect
  #   puts note.user.inspect
  #   #"inspect":オブジェクトや配列などをわかりやすく文字列で返してくれるメソッド
  #   #"オブジェクトや配列など".inspect
  # end

  # before do
  #   @user = FactoryBot.create(:user)
  #   @project = FactoryBot.create(:project, user_id: @user.id)
  # end

  # # ユーザー、プロジェクト、メッセージがあれば有効な状態であること
  # it "is valid with a user, project and message" do
  #   note = FactoryBot.create(:note, message: "This is a sample note.")
  #   expect(note).to be_valid
  # end

  # メッセージがなければ無効な状態であること
  # it "is invalid without a message" do
  #   note = FactoryBot.create(:note, message: nil)
  #   # expect(note).to be_valid
  #   note.valid?
  #   expect(note.errors[:message]).to include("can't be blank")
  # end

  # # 文字列に一致するメッセージを検索する
  # describe "search messages for a term " do
  #   before do
  #     @note1 = FactoryBot.create( :note, message: "This is the first note." )
  #     @note2 = FactoryBot.create( :note, message: "This is the second note." )
  #     @note3 = FactoryBot.create( :note, message: "First, preheat the oven.", )
  #   end

  # # 一致するデータが見つかる時
  #   context "when a match is faound" do
  #     # 検索文字列に一致するメモを返すこと
  #     it "returns notes that match the search term" do
  #       expect(Note.search("first")).to include(@note1, @note3)
  #       expect(Note.search("first")).to_not include(@note2)
  #     end
  #   end

  # # 一致するデータがない時
  #   context "when no match is faound" do
  #     # 空のコレクションを返すこと
  #     it "returns an empty collection when no results are found" do
  #       expect(Note.search("third")).to be_empty
  #     end
  #   end
  # end
end