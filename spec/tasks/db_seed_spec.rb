require 'spec_helper'
require 'rake'

Osirixnodes::Application.load_tasks

describe 'db:seed' do
  # User
  let(:api_key) { 'example' } # https://osirixnodes.com/plist/example
  let(:email)   { 'example@osirixnodes.com' }

  # Node
  let(:name)    { 'OsiriXNodes.com' }
  let(:aetitle) { 'EXAMPLE' }
  let(:address) { '127.0.0.1' }
  let(:port)    { 11112 }

  let(:user) { User.find_by(api_key: api_key) }
  let(:node) { user.nodes.first }

  def run_task
    Rake::Task['db:seed'].invoke
    Rake::Task['db:seed'].reenable # Otherwise the task would run only once.
  end

  shared_examples_for 'db:seed' do
    it 'creates example user' do
      expect(user.email).to eq(email)
      password = Rails.application.secrets.example_user_password
      expect(user.valid_password?(password)).to be true
    end

    it 'creates example node' do
      expect(node.name).to    eq(name)
      expect(node.aetitle).to eq(aetitle)
      expect(node.address).to eq(address)
      expect(node.port).to    eq(port)
    end
  end

  describe 'transfer syntaxes' do
    let(:transfer_syntaxes) do
      {
        'Explicit Little Endian'           => 0,
        'Implicit Little Endian'           => 9,
        'JPEG 2000 Lossless'               => 1,
        'JPEG 2000 Lossy - High Quality'   => 2,
        'JPEG 2000 Lossy - Medium Quality' => 3,
        'JPEG 2000 Lossy - Low Quality'    => 4,
        'JPEG LS Lossless'                 => 13,
        'JPEG LS Lossy - High Quality'     => 15,
        'JPEG LS Lossy - Medium Quality'   => 16,
        'JPEG LS Lossy - Low Quality'      => 14,
        'JPEG Lossless'                    => 5
      }
    end

    def validate_transfer_syntaxes
      transfer_syntaxes.each do |name,value|
        transfer_syntax = TransferSyntax.find_by(value: value)
        expect(transfer_syntax).to be,
          "Transfer Syntax #{value} missing (#{name})"
        expect(transfer_syntax.name).to eq(name)
      end
    end

    it 'creates missing' do
      run_task
      validate_transfer_syntaxes
    end

    it 'updates existing' do
      transfer_syntaxes.values.each do |value|
        TransferSyntax.create!(value: value, name: 'Chunky Bacon')
      end
      run_task
      validate_transfer_syntaxes
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
