require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "#index" do
    #正常にレスポンスを返すこと
    it "responds successfully" do
      get :index
      expect(response).to be_successful
      #"esponse":レスポンスス テータスが成功(200レスポンス)か、それ以外(たとえば500エラー)であるかをチェック
    end

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

end
