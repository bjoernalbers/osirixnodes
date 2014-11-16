require 'rails_helper'

describe NodesController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns the nodes' do
      node = create(:node, user: user)
      get :index
      expect(assigns(:nodes)).to match_array [node]
    end
  end
end
