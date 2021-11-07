require 'rails_helper'
RSpec.describe "Tweets", type: :request do
  describe "GET /tweets" do
    before do
      @user = FactoryBot.create(:user)
    end
    it 'ログインしているuserでは200レスポンスを返すこと' do
      sign_in @user
      get tweets_path
      expect(response).to have_http_status(200)
    end
    it 'ログインしてないuserでは302レスポンスを返すこと' do
      get tweets_path
      expect(response).to have_http_status(302)
    end
  end
end
