require 'rails_helper'

describe SchedulesController do
  let(:params) do
    {
      'time(4i)' => 10,
      'time(5i)' => 10
    }
  end

  describe "GET index" do
    let!(:schedule) { create(:schedule) }

    it "assigns @tweets" do
      get :index
      expect(assigns(:schedules)).to eq([schedule])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    it "creates schedule" do
      expect { post :create, schedule: params }.to change(Schedule, :count).by(1)
    end
  end

  describe "PATCH update" do
    let!(:schedule) { create(:schedule) }

    it "update schedule" do
      patch :update, id: schedule.id, schedule: params
      expect(Schedule.last.time.hour).to eq(10)
    end
  end

  describe "DELETE destroy" do
    let!(:schedule) { create(:schedule) }

    it "delete schedule" do
      expect { delete :destroy, id: schedule.id }.to change(Schedule, :count).by(-1)
    end
  end
end
