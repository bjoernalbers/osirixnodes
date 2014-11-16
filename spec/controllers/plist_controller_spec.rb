require 'rails_helper'

describe PlistController do
  describe 'GET #show' do
    context 'with invalid API key' do
      before do
        get :show, id: 'invalid_bullshit'
      end

      it 'responds with http unauthorized' do
        expect(response.status).to eq 401
      end

      it 'responds without body' do
        expect(response.body).to match(/^\s*/)
      end
    end

    context 'with valid API key' do
      let(:user) { create(:user) }

      before do
        get :show, id: user.api_key
      end

      it 'assigns the users nodes' do
        expect(assigns(:nodes)).to be
      end

      it 'renders plist template' do
        expect(response).to render_template(:show)
      end

      it 'responds with http success' do
        expect(response.status).to eq 200
      end
    end
  end
end
