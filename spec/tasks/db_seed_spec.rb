require 'spec_helper'
require 'rake'

Osirixnodes::Application.load_tasks

describe 'db:seed' do
  # Node
  let(:name)    { 'A boring example node' }
  let(:aetitle) { 'OSIRIXNODES' }
  let(:address) { '127.0.0.1' }
  let(:port)    { 11112 }

  let(:node) { Node.last }

  before do
    Rake::Task['db:seed'].invoke
  end
    
  it 'creates example node' do
    expect(node.name).to    eq(name)
    expect(node.aetitle).to eq(aetitle)
    expect(node.address).to eq(address)
    expect(node.port).to    eq(port)
  end
end
