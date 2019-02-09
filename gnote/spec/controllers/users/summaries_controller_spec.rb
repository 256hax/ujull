require 'rails_helper'

RSpec.describe Users::SummariesController, type: :controller do

  describe "GET #index" do
    context "when user is not logged in" do
      it "redirect to login page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user logged in" do
      login_user

      it "response successfully" do
        get :index
        expect(response).to be_successful
      end
    end
  end
end
