require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @project = FactoryBot.create(:project, owner: @user)
    @task = @project.tasks.create!(name: "Test task")
  end

  # describe "#show" do
  #   # JSON 形式でレスポンスを返すこと
  #   it "responses with JSON formatted output" do
  #     sign_in @user
  #     get :show, format: :json,
  #       params: {project_id: @project.id, id: @task.id }
  #     expect(response.content_type).to include "application/json"
  #   end
  # end

  describe "create" do
     # タスクが作成できること
    # it "add a task" do
    #   sign_in @user
    #   new_task = {name: "New test task"}
    #   expect{
    #     post :create, params: {project_id: @project.id, task: new_task}
    #   }.to change(@project.tasks, :count).by(1)
    # end

    # # JSON 形式でレスポンスを返すこと
    # it "responses with JSON formatted output" do
    #   new_task = { name: "New test task" }
    #   sign_in @user
    #   post :create, format: :json,
    #     params: { project_id: @project.id, task: new_task }
    #   expect(response.content_type).to include "application/json"
    # end

    # 新しいタスクをプロジェクトに追加すること
    it "adds a new task to project" do
      sign_in @user
      task_params = {name: "Add new task"}
      expect{
        post :create, format: :json,
          params: {project_id: @project.id, task: task_params}
      }.to change(@project.tasks, :count).by(1)
    end

    # 認証を要求すること
    it "requires authentication" do
      task_params = {name: "Add new task"}
      expect{
        post :create, format: :json,
          params: {project_id: @project.id, task: task_params}
      }.to_not change(@project.tasks, :count)
      expect(response).to_not be_successful
    end
  end
end
