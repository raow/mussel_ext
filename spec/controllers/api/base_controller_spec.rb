require 'rails_helper'

class InheritsFromApiBaseController < Api::BaseController
  def show
    render text: "text"
  end
end

RSpec.describe Api::BaseController, type: :controller do

  before(:each) do
    Rails.application.routes.draw do
      get '/show' => "inherits_from_api_base#show"
    end
    @controller = InheritsFromApiBaseController.new
  end

  after(:each) do
    Rails.application.reload_routes!
  end

  describe "Test api base" do
    it "will pass request" do
      get :show
      expect(response.body).to eq("text")
    end
  end
end