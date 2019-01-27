require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Message. As you add validations to Message, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {{
    :body => Faker::Lorem.sentence,
    :message_id => 1,
    :user_id => 1
  }}

  let(:invalid_attributes) {{
    :body => '', # empty body
    :user_id => 0 # not exist user
  }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MessagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  # describe "GET #index" do
  #   login_user
  #
  #   it "response successfully" do
  #     get :index
  #     expect(response).to be_successful
  #   end
  # end

  describe "GET #new" do
    #login_user

    context "when user is not logged in" do
      #logout_user

      it "redirect to login page" do
        get :new, params: { message_id: 1 }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user logged in" do
      login_user

      before do
        @message = FactoryBot.create(:message)
      end

      it "should have a current_user" do
        # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
        expect(subject.current_user).to_not eq(nil)
      end

      it "response successfully" do
        get :new, params: { message_id: 1 }
        expect(response).to be_successful
      end
    end
  end

  describe "POST #create" do
    login_user

    before do
      @message = FactoryBot.create(:message)
    end
    
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: {message_id: 1, comment: valid_attributes}, session: valid_session
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the created message" do
        post :create, params: {message_id: 1, comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "has not saved" do
        expect {
          post :create, params: {message_id: 1, comment: invalid_attributes}, session: valid_session
        }.to change(Comment, :count).by(0)
      end
    end

    context "when user is not logged" do
      logout_user

      it "redirect to login page" do
        post :create, params: {message_id: 1, comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  # describe "DELETE #destroy" do
  #   it "destroys the requested message" do
  #     message = Message.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: message.to_param}, session: valid_session
  #     }.to change(Message, :count).by(-1)
  #   end
  #
  #   it "redirects to the messages list" do
  #     message = Message.create! valid_attributes
  #     delete :destroy, params: {id: message.to_param}, session: valid_session
  #     expect(response).to redirect_to(messages_url)
  #   end
  # end

end
