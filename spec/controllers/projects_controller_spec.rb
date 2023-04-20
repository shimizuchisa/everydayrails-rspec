require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  # describe "#index" do
  #   # 認証済みのユーザーとして
  #   context "as an authenticated user" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #     end

  #     #正常にレスポンスを返すこと
  #     it "responds successfuly" do
  #       sign_in @user
  #       get :index
  #       expect(response).to be_successful
  #     end

  #     it "returns a 200 response" do
  #       sign_in @user
  #       get :index
  #       expect(response).to have_http_status "200"
  #     end
  #   end

  #   #ゲストとして
  #   context "as an guest user" do
  #     #正常にレスポンスを返すこと
  #     it "redirects to the sign-in page" do
  #       get :index
  #       expect(response).to redirect_to "/users/sign_in"
  #     end

  #     it "returns a 302 response" do
  #       get :index
  #       expect(response).to have_http_status "302"
  #     end
  #   end
  # end

  describe "show" do
    # 認可されたユーザーとして
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @project = FactoryBot.create(:project, owner: @user)
      end

      # 正常にレスポンスを返すこと
      it "responds successfully" do
        sign_in @user
        get :show, params: {id: @project.id}
        expect(response).to be_successful
      end
    end

    # 認可されていないユーザーとして
    context "as an unauthoprized user" do
      before do
        @user = FactoryBot.create(:user)
        @project = FactoryBot.create(:project, owner: @user)
        @other = FactoryBot.create(:user)
      end

      # ダッシュボードにリダイレクトすること
      it "responds unsuccessfully" do
        sign_in @other
        get :show, params: {id: @project.id}
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "create" do
    #認証済みのユーザーとして
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
      end

      # プロジェクトを追加できること
      it "add a project" do
        sign_in @user
        #attributes_for(:モデル)・・・ファクトリからテスト用の属性値をハッシュとして作成
        project_params = FactoryBot.attributes_for(:project)
        expect {
          post :create, params: { project: project_params }
        }.to change(@user.projects, :count).by(1)
      end
    end

    # ゲストとして
    context "as an guest" do
      #302レスポンスを返すこと
      it "returnes response 302 " do
        project_params = FactoryBot.attributes_for(:project)
        post :create, params: { project: project_params}
        expect(response).to have_http_status "302"
      end

      #3サインイン画面にリダイレクトすること
      it
    end
  end
end
