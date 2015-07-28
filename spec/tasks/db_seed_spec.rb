require 'spec_helper'
require 'rake'

Osirixnodes::Application.load_tasks

describe 'db:seed' do
  # User
  let(:api_key) { 'example' } # https://osirixnodes.com/plist/example
  let(:email)   { 'example@osirixnodes.com' }

  # Node
  let(:name)    { 'A boring example node' }
  let(:aetitle) { 'OSIRIXNODES_COM' }
  let(:address) { '127.0.0.1' }
  let(:port)    { 11112 }

  let(:user) { User.find_by(api_key: api_key) }
  let(:node) { user.nodes.first }

  def run_task
    Rake::Task['db:seed'].invoke
    Rake::Task['db:seed'].reenable # Otherwise the task would run only once.
  end

  # TODO: Remove spec for example user!
  shared_examples_for 'db:seed' do
    it 'creates example user' do
      expect(user.email).to eq(email)
      password = 'chunkybacon'
      expect(user.valid_password?(password)).to be true
    end

    it 'creates example node' do
      expect(node.name).to    eq(name)
      expect(node.aetitle).to eq(aetitle)
      expect(node.address).to eq(address)
      expect(node.port).to    eq(port)
    end
  end

  context 'with unseeded database' do
    before do
      run_task
    end
    
    it_behaves_like 'db:seed'
  end

  context 'with seeded database' do
    before do
      # Seed database with wrong example user and node.
      user = create(:user, api_key: api_key)
      node = create(:node, user: user)
      run_task
    end

    it_behaves_like 'db:seed'
  end
end
