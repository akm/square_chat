require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe RoomsController, type: :controller do

  login_user
  let(:organization){ FactoryGirl.create(:organization) }

  # This should return the minimal set of attributes required to create a valid
  # Room. As you add validations to Room, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:room).merge(organization_id: organization.id)
  }

  let(:invalid_attributes) {
    valid_attributes.merge(:name => '')
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RoomsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all rooms as @rooms" do
      room = FactoryGirl.create(:room)
      get :index, params: {}, session: valid_session
      expect(assigns(:rooms)).to eq([room])
    end
  end

  describe "GET #show" do
    it "assigns the requested room as @room" do
      room = FactoryGirl.create(:room)
      get :show, params: {:id => room.to_param}, session: valid_session
      expect(assigns(:room)).to eq(room)
    end
  end

  describe "GET #new" do
    it "assigns a new room as @room" do
      get :new, params: {}, session: valid_session
      expect(assigns(:room)).to be_a_new(Room)
    end
  end

  describe "GET #edit" do
    it "assigns the requested room as @room" do
      room = FactoryGirl.create(:room)
      get :edit, params: {:id => room.to_param}, session: valid_session
      expect(assigns(:room)).to eq(room)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Room" do
        expect {
          post :create, params: {:room => valid_attributes}, session: valid_session
        }.to change(Room, :count).by(1)
      end

      it "assigns a newly created room as @room" do
        post :create, params: {:room => valid_attributes}, session: valid_session
        expect(assigns(:room)).to be_a(Room)
        expect(assigns(:room)).to be_persisted
      end

      it "redirects to the created room" do
        post :create, params: {:room => valid_attributes}, session: valid_session
        expect(response).to redirect_to(Room.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved room as @room" do
        post :create, params: {:room => invalid_attributes}, session: valid_session
        expect(assigns(:room)).to be_a_new(Room)
      end

      it "re-renders the 'new' template" do
        post :create, params: {:room => invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_name){ valid_attributes[:name].succ }

      let(:new_attributes) {
        valid_attributes.merge(name: new_name)
      }

      it "updates the requested room" do
        room = FactoryGirl.create(:room)
        put :update, params: {:id => room.to_param, :room => new_attributes}, session: valid_session
        room.reload
        expect(room.name).to eq new_name
      end

      it "assigns the requested room as @room" do
        room = FactoryGirl.create(:room)
        put :update, params: {:id => room.to_param, :room => valid_attributes}, session: valid_session
        expect(assigns(:room)).to eq(room)
      end

      it "redirects to the room" do
        room = FactoryGirl.create(:room)
        put :update, params: {:id => room.to_param, :room => valid_attributes}, session: valid_session
        expect(response).to redirect_to(room)
      end
    end

    context "with invalid params" do
      it "assigns the room as @room" do
        room = FactoryGirl.create(:room)
        put :update, params: {:id => room.to_param, :room => invalid_attributes}, session: valid_session
        expect(assigns(:room)).to eq(room)
      end

      it "re-renders the 'edit' template" do
        room = FactoryGirl.create(:room)
        put :update, params: {:id => room.to_param, :room => invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested room" do
      room = FactoryGirl.create(:room)
      expect {
        delete :destroy, params: {:id => room.to_param}, session: valid_session
      }.to change(Room, :count).by(-1)
    end

    it "redirects to the rooms list" do
      room = FactoryGirl.create(:room)
      delete :destroy, params: {:id => room.to_param}, session: valid_session
      expect(response).to redirect_to(rooms_url)
    end
  end

end
