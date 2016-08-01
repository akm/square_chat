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

RSpec.describe MembershipsController, type: :controller do

  let(:organization){ FactoryGirl.create(:organization) }
  let(:user){ FactoryGirl.create(:user) }
  before{ devise_user_login(user) }

  let(:membership){ FactoryGirl.create(:membership, organization: organization, user: user) }

  # This should return the minimal set of attributes required to create a valid
  # Membership. As you add validations to Membership, be sure to
  # adjust the attributes here as well.
  let(:valid_parameters) {
    FactoryGirl.attributes_for(:membership).merge(organization_id: organization.id, user_id: user.id)
  }

  let(:invalid_parameters) {
    valid_parameters.symbolize_keys.merge(name: '')
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MembershipsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all memberships as @memberships" do
      get :index, {}, valid_session
      expect(assigns(:memberships)).to eq([membership])
    end
  end

  describe "GET #show" do
    it "assigns the requested membership as @membership" do
      membership # To create membership
      get :show, {:id => membership.to_param}, valid_session
      expect(assigns(:membership)).to eq(membership)
    end
  end

  describe "GET #new" do
    it "assigns a new membership as @membership" do
      get :new, {}, valid_session
      expect(assigns(:membership)).to be_a_new(Membership)
    end
  end

  describe "GET #edit" do
    it "assigns the requested membership as @membership" do
      membership # To create membership
      get :edit, {:id => membership.to_param}, valid_session
      expect(assigns(:membership)).to eq(membership)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Membership" do
        expect {
          post :create, {:membership => valid_parameters}, valid_session
        }.to change(Membership, :count).by(1)
      end

      it "assigns a newly created membership as @membership" do
        post :create, {:membership => valid_parameters}, valid_session
        expect(assigns(:membership)).to be_a(Membership)
        expect(assigns(:membership)).to be_persisted
      end

      it "redirects to the created membership" do
        post :create, {:membership => valid_parameters}, valid_session
        expect(response).to redirect_to(Membership.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved membership as @membership" do
        post :create, {:membership => invalid_parameters}, valid_session
        expect(assigns(:membership)).to be_a_new(Membership)
      end

      it "re-renders the 'new' template" do
        post :create, {:membership => invalid_parameters}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_name){ valid_parameters[:name].succ }
      let(:new_role){ valid_parameters[:role].succ }

      let(:new_parameters) {
        valid_parameters.merge(name: new_name, role: new_role)
      }

      it "updates the requested membership" do
        membership # To create membership
        put :update, {:id => membership.to_param, :membership => new_parameters}, valid_session
        membership.reload
        expect(membership.name).to eq new_name
        expect(membership.role_before_type_cast).to eq new_role
      end

      it "assigns the requested membership as @membership" do
        membership # To create membership
        put :update, {:id => membership.to_param, :membership => valid_parameters}, valid_session
        expect(assigns(:membership)).to eq(membership)
      end

      it "redirects to the membership" do
        membership # To create membership
        put :update, {:id => membership.to_param, :membership => valid_parameters}, valid_session
        expect(response).to redirect_to(membership)
      end
    end

    context "with invalid params" do
      it "assigns the membership as @membership" do
        membership # To create membership
        put :update, {:id => membership.to_param, :membership => invalid_parameters}, valid_session
        expect(assigns(:membership)).to eq(membership)
      end

      it "re-renders the 'edit' template" do
        membership # To create membership
        put :update, {:id => membership.to_param, :membership => invalid_parameters}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested membership" do
      membership # To create membership
      expect {
        delete :destroy, {:id => membership.to_param}, valid_session
      }.to change(Membership, :count).by(-1)
    end

    it "redirects to the memberships list" do
      membership # To create membership
      delete :destroy, {:id => membership.to_param}, valid_session
      expect(response).to redirect_to(memberships_url)
    end
  end

end
