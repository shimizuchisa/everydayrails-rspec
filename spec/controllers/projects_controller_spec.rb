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

  # describe "show" do
  #   # 認可されたユーザーとして
  #   context "as an authorized user" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       @project = FactoryBot.create(:project, owner: @user)
  #     end

  #     # 正常にレスポンスを返すこと
  #     it "responds successfully" do
  #       sign_in @user
  #       get :show, params: {id: @project.id}
  #       expect(response).to be_successful
  #     end
  #   end

  #   # 認可されていないユーザーとして
  #   context "as an unauthoprized user" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       @project = FactoryBot.create(:project, owner: @user)
  #       @other = FactoryBot.create(:user)
  #     end

  #     # ダッシュボードにリダイレクトすること
  #     it "responds unsuccessfully" do
  #       sign_in @other
  #       get :show, params: {id: @project.id}
  #       expect(response).to redirect_to root_path
  #     end
  #   end
  # end

  # describe "create" do
  #   #認証済みのユーザーとして
  #   context "as an authorized user" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #     end

  #     #有効な属性値の場合
  #     context "with valid attributes" do
  #       # プロジェクトを追加できること
  #       it "adds a project" do
  #         sign_in @user
  #         #attributes_for(:モデル)・・・ファクトリからテスト用の属性値をハッシュとして作成
  #         project_params = FactoryBot.attributes_for(:project)
  #         expect {
  #           post :create, params: { project: project_params }
  #         }.to change(@user.projects, :count).by(1)
  #       end
  #     end

  #     #無効な属性値の場合
  #     context "with invalid attributes" do
  #       #プロジェクトを追加できないこと
  #       it "does not add a project" do
  #         sign_in @user
  #         project_params = FactoryBot.attributes_for(:project, :invalid)
  #         expect{
  #         post :create, params: { project: project_params }
  #         }.to_not change(@user.projects, :count)
  #       end
  #     end
  #   end

  #   # ゲストとして
  #   context "as a guest" do
  #     #302レスポンスを返すこと
  #     it "returnes a 302 response" do
  #       project_params = FactoryBot.attributes_for(:project)
  #       post :create, params: { project: project_params}
  #       expect(response).to have_http_status "302"
  #     end

  #     #3サインイン画面にリダイレクトすること
  #     it "redirect to sign_in page" do
  #       project_params = FactoryBot.attributes_for(:project)
  #       post :create, params: { project: project_params }
  #       expect(response).to redirect_to "/users/sign_in"
  #     end
  #   end
  # end

  # describe "update" do
  #   #認可されたユーザーとして
  #   context "as a authorized user" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       @project = FactoryBot.create(:project, owner: @user)
  #     end
  #     #自分のプロジェクトは編集できる
  #     it "updates a project" do
  #       sign_in @user
  #       project_params = FactoryBot.attributes_for(:project, name: "New project name")
  #       patch :update, params: {id: @project.id, project: project_params}
  #       expect(@project.reload.name).to eq "New project name"
  #     end
  #   end

  #   # 認可されていないユーザーとして
  #   context "as an unauthorized user" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       @other = FactoryBot.create(:user)
  #       @other_project = FactoryBot.create(:project, owner: @other)
  #     end
  #     #自分ではないのプロジェクトは編集できないこと
  #     it "can't update the project" do
  #       sign_in @user
  #       project_params = FactoryBot.attributes_for(:project, name: "Other project name")
  #       patch :update, params: {id: @other_project.id, project: project_params}
  #       expect(@other_project.reload.name).to eq "Other project name"
  #     end

  #     #ダッシュボードへリダイレクトとすること
  #     it "redirects to the dashboard" do
  #       sign_in @user
  #       project_params = FactoryBot.attributes_for(:project, name: "Other project name")
  #       patch :update, params: {id: @other_project.id, project: project_params}
  #       expect(response).to redirect_to root_path
  #     end
  #   end

  #   #ゲストとして
  #   context "as a guest user" do
  #     before do
  #       @other = FactoryBot.create(:user)
  #       @other_project = FactoryBot.create(:project, owner: @other)
  #     end

  #     # 302レスポンスを返すこと
  #     it "returns a 302 response" do
  #       project_params = FactoryBot.attributes_for(:project, name: "Other's project")
  #       patch :update, params: {id: @other_project.id, project: project_params}
  #       expect(response).to have_http_status "302"
  #     end

  #     #サインイン画面にリダイレクトすること
  #     it "redirects to sign_in page" do
  #       project_params = FactoryBot.attributes_for(:project, name: "Other's project")
  #       patch :update, params: {id: @other_project.id, project: project_params}
  #       expect(response).to redirect_to  "/users/sign_in"
  #     end
  #   end
  # end

  # describe "destroy" do
  #   #認可されたユーザーとして
  #   context "as an authorized user" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       @project = FactoryBot.create(:project, owner: @user)
  #     end

  #     #自分のプロジェクトは削除できること
  #     it "deletes a project" do
  #       sign_in @user
  #       expect{
  #         delete :destroy, params: {id: @project.id}
  #         }.to change(@user.projects, :count).by(-1)
  #     end
  #   end

  #   #認可されていないユーザーとして
  #   context "as an unauthorized user" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       @other = FactoryBot.create(:user)
  #       @project = FactoryBot.create(:project, owner: @other)
  #     end

  #     #自分のものではないプロジェクトは削除できないこと
  #     it "does not destroy the project" do
  #       sign_in @user
  #       expect{
  #         delete :destroy, params: {id: @project.id}
  #         }.to_not change(Project, :count)
  #     end

  #     #ダッシュボードに遷移すること
  #     it "redirects to dashboard" do
  #       sign_in @user
  #       delete :destroy, params: {id: @project.id}
  #       expect(response).to redirect_to root_path
  #     end
  #   end

  #   #ゲストとして
  #   context "as a guest" do
  #     before do
  #       @project = FactoryBot.create(:project)
  #     end

  #     #削除できないこと
  #     it "does not delete the project" do
  #       delete :destroy, params: {id: @project.id}
  #       expect(response).to have_http_status "302"
  #     end

  #     #ログインページにリダイレクトすること
  #     it "redirect to sign_in page" do
  #       delete :destroy, params: {id: @project.id}
  #       expect(response).to redirect_to "/users/sign_in"
  #     end
  #   end
  # end
end


