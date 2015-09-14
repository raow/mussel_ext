require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do

  describe "Create session" do
    it 'login with login and password' do
      car_owner_user = create(:car_owner_user)

      post :create, { login: car_owner_user.email, password: car_owner_user.password }
      expect(JSON.parse(response.body)["session"]["auth_token"]).not_to eq(nil)
      expect(JSON.parse(response.body)["code"]).to eq("0000")

      car_owner_user.reload
      expect {
        post :create, { login: car_owner_user.email, password: car_owner_user.password }
      }.to change { car_owner_user.reload.authentication_token }

      post :create, { login: nil, password: nil }
      expect(JSON.parse(response.body)["session"]["auth_token"]).to eq(nil)
      expect(JSON.parse(response.body)["code"]).to eq("9989")
      
      post :create, { login: car_owner_user.email, password: nil }
      expect(JSON.parse(response.body)["session"]["auth_token"]).to eq(nil)
      expect(JSON.parse(response.body)["code"]).to eq("9989")

      post :create, { login: "test@abc.com", password: "abcdefg" }
      expect(JSON.parse(response.body)["session"]["auth_token"]).to eq(nil)
      expect(JSON.parse(response.body)["code"]).to eq("9988")

      expect {
        post :create, { login: car_owner_user.email, password: "abcdefg" }
        expect(JSON.parse(response.body)["session"]["auth_token"]).to eq(nil)
        expect(JSON.parse(response.body)["code"]).to eq("9987")
      }.not_to change { car_owner_user.reload.authentication_token }
    end
  end

  describe "Refrush session" do
    it "refrush session" do
      car_owner_user_authenticated = create(:car_owner_user_authenticated)

      post :create, { login: car_owner_user_authenticated.email, password: car_owner_user_authenticated.password }
      post :refrush, { auth_token: car_owner_user_authenticated.reload.authentication_token }
      expect(JSON.parse(response.body)["code"]).to eq("0")
      expect {
        post :refrush, { auth_token: car_owner_user_authenticated.reload.authentication_token }
      }.to change { car_owner_user_authenticated.reload.authentication_token }
    end
  end

  describe "Destroy session" do
    it "destroy session" do
      car_owner_user_authenticated = create(:car_owner_user_authenticated)

      expect {
        delete :destroy, { auth_token: car_owner_user_authenticated.authentication_token }
        expect(JSON.parse(response.body)["code"]).to eq("0")
        expect(car_owner_user_authenticated.reload.authentication_token).to eq(nil)
      }.to change { car_owner_user_authenticated.reload.authentication_token }
    end
  end
end