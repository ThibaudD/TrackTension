require 'rails_helper'

RSpec.describe MeasuresController, type: :controller do

  subject { create(:user) }

  before :each do
    login_with create( :user )
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the measure' do
        post :create, measure: attributes_for(:measure, user: subject)
        expect(Measure.count).to eq(1)
      end

      it 'redirects to the "index" action for the new measure with notice' do
        post :create, measure: attributes_for(:measure, user: subject)
        expect(response).to redirect_to(:action => 'index', :notice => "Measure was successfully created.")
      end
    end

    context 'with invalid attributes' do
      it 'does not create the measure' do
        post :create, measure: attributes_for(:measure, systolic: nil)
        expect(Measure.count).to eq(0)
      end

      it 're-renders the "new" view' do
        post :create, measure: attributes_for(:measure, systolic: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the measure' do
      @measure = create(:measure)
      expect{
        delete :destroy, :id => @measure.id
      }.to change(Measure, :count).by(-1)
    end
  end

end
