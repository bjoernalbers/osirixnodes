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

    it 'responds with right content type' do
      expect(response.content_type).to eq 'application/xml'
    end
    
    it 'returns all nodes' do
      expect(plist_response.count).to eq(1)
    end

    it 'includes node names' do
      expect(first_node['Description']).to eq(node.name)
    end

    it 'includes node aetitles' do
      expect(first_node['AETitle']).to eq(node.aetitle)
    end

    it 'includes node addresses' do
      expect(first_node['Address']).to eq(node.address)
    end

    it 'includes node ports' do
      expect(first_node['Port']).to eq(node.port)
    end

    it 'includes node transfer syntax' do
      expect(first_node['TransferSyntax']).to eq(node.transfer_syntax)
    end

    it 'includes node retrieve mode' do
      expect(first_node['retrieveMode']).to eq(node.retrieve_mode)
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
