describe 'PList API' do
  def plist_response
    @plist_response ||= Plist::parse_xml(response.body)
  end

  describe 'with valid API key' do
    let!(:user) { create(:user, api_key: 'deadbeef') }
    let!(:node) { create(:node, user: user) }
    let(:first_node) { plist_response.first }

    before do
      get "/plist/#{user.api_key}"
    end

    it 'responds with status success' do
      expect(response.status).to eq(200)
    end

    it 'responds with the right content type' do
      expect(response.content_type).to eq 'application/xml'
    end
    
    it 'returns all nodes' do
      expect(plist_response.count).to eq(1)
    end

    it 'includes the node names' do
      expect(first_node['Description']).to eq(node.name)
    end

    it 'includes the node aetitles' do
      expect(first_node['AETitle']).to eq(node.aetitle)
    end

    it 'includes the node addresses' do
      expect(first_node['Address']).to eq(node.address)
    end

    it 'includes the node ports' do
      expect(first_node['Port']).to eq(node.port)
    end
  end

  describe 'with invalid API key' do
    before do
      get '/plist/invalid'
    end

    it 'responds with status unauthorized' do
      expect(response.status).to eq(401)
    end

    it 'responds without body' do
      expect(response.body).to match(/^\s*/)
    end
  end
end
