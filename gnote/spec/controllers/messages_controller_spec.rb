require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Message. As you add validations to Message, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MessagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #new" do
    context "when user is not logged in" do
      it "http status is 302" do
        get :new
        expect(response).to have_http_status(302)
      end
    end

    context "when user log in" do
      login_user

      it "should have a current_user" do
        # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
        expect(subject.current_user).to_not eq(nil)
      end

      it "http status is 200" do
        get :new
        expect(response).to be_successful
      end
    end
  end

  # describe "GET #index" do
  #   it "returns a success response" do
  #     Message.create! valid_attributes
  #     get :index, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  #
  # describe "GET #show" do
  #   it "returns a success response" do
  #     message = Message.create! valid_attributes
  #     get :show, params: {id: message.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns a success response" do
  #     message = Message.create! valid_attributes
  #     get :edit, params: {id: message.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Message" do
  #       expect {
  #         post :create, params: {message: valid_attributes}, session: valid_session
  #       }.to change(Message, :count).by(1)
  #     end
  #
  #     it "redirects to the created message" do
  #       post :create, params: {message: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(Message.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: {message: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested message" do
  #       message = Message.create! valid_attributes
  #       put :update, params: {id: message.to_param, message: new_attributes}, session: valid_session
  #       message.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the message" do
  #       message = Message.create! valid_attributes
  #       put :update, params: {id: message.to_param, message: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(message)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       message = Message.create! valid_attributes
  #       put :update, params: {id: message.to_param, message: invalid_attributes}, session: valid_session
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
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
