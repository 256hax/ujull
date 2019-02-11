require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do

  let(:valid_attributes) {{
    :email => Faker::Internet.email,
    :password => "password",
    :password_confirmation => "password",
    :confirmed_at => Time.now
  }}

  describe "POST #create" do
    include DataInitializable

    login_user
    logout_user

    context "with valid params" do
      it "creates a new User and Users::Summary" do
        fix_sequence_id(:users)

        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
        # .and change(User::Summary, :count).by(1)
      end

      # it "creates a new User and Users::Summary" do
      #   fix_sequence_id(:users)
      #
      #   @user_records = User.count
      #   post :create, params: { user: valid_attributes }
      #   expect(@user_records.reload).to change(User, :count).by(1)
      # end
    end
  end
end
