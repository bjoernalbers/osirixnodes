describe 'GET /nodes.plist' do
  def plist_response
    @plist_response ||= Plist::parse_xml(response.body)
  end

  let!(:node) { create(:node, qr: false) }
  let(:first_node) { plist_response.first }

  before do
    get '/nodes.plist'
  end

  it 'responds with status success' do
    expect(response.status).to eq(200)
  end

  it 'responds with content type "application/plist"' do
    expect(response.content_type).to eq 'application/plist'
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

  it 'includes QR' do
    expect(first_node['QR']).to eq node.qr
  end

  it 'includes TLSAuthenticated' do
    expect(first_node['TLSAuthenticated']).to eq false
  end

  it 'includes TLSEnabled' do
    expect(first_node['TLSEnabled']).to eq false
  end

  it 'includes node transfer syntax' do
    expect(first_node['TransferSyntax']).to eq(node.transfer_syntax)
  end

  it 'includes node retrieve mode' do
    expect(first_node['retrieveMode']).to eq(node.retrieve_mode)
  end
end
