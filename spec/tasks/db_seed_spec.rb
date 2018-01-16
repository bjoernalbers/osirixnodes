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

  def run_task
    Rake::Task['db:seed'].invoke
    Rake::Task['db:seed'].reenable # Otherwise the task would run only once.
  end

  shared_examples_for 'db:seed' do
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
      # Seed database with wrong example node.
      node = create(:node)
      run_task
    end

    it_behaves_like 'db:seed'
  end
end
