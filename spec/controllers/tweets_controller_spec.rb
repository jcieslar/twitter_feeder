require 'rails_helper'

describe TweetsController do
  describe "GET index" do
    let!(:tweet) { create(:tweet) }
    it "assigns @tweets" do
      get :index
      expect(assigns(:tweets)).to eq([tweet])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
