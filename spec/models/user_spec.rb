require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { build(:user) }

  it 'has valid factory' do
    expect(user).to be_valid
  end

  it 'has many nodes' do
    node = create(:node, user: user)
    expect(user.nodes).to match_array [node]
  end

  context 'without email' do
    before do
      user.email = nil
    end

    it 'is invalid' do
      expect(user).to be_invalid
      expect(user.errors[:email]).to_not be_empty
    end

    it 'can be saved' do
      expect{ user.save!(validate: false) }.to_not raise_error
    end
  end

  it 'validates password presence' do
    user = build(:user, password: nil)
    expect(user).to be_invalid
    expect(user.errors[:password]).to_not be_empty
  end

  it 'validates api_key presence in database' do
    user = create(:user)
    user.api_key = nil
    expect { user.save!(validate: false) }.to raise_error
  end

  describe '#api_key' do
    context 'when missing on create' do
      let(:api_key) { 'deadbeef' }
      let(:user) { create(:user, api_key: nil) }

      before do
        allow(SecureRandom).to receive(:hex).
          and_return(api_key, api_key, api_key, 'chunky_bacon')
      end

      it 'gets secure random value' do
        expect(user.api_key).to eq(api_key)
      end

      it 'gets unique value' do
        create(:user, api_key: api_key)
        expect(user.api_key).to eq('chunky_bacon')
      end
    end

    context 'when present on create' do
      let(:api_key) { 'secret' }
      let(:user) { create(:user, api_key: api_key) }

      it 'gets assigned' do
        expect(user.api_key).to eq api_key
      end
    end
  end

  it 'deletes dependend nodes on destroy' do
    user = create(:user)
    node = create(:node, user: user)
    expect(Node).to exist(node)
    user.destroy
    expect(Node).to_not exist(node)
  end

  it 'creates sample node after create' do
    user = create(:user)
    user.send(:create_sample_node) #TODO: Remove this hack!
    expect(user.nodes.count).to eq 1
    node = user.nodes.first
    expect(node.name).to eq 'Your wonderful example node'
    expect(node.aetitle).to eq 'HELLO'
    expect(node.address).to eq '127.0.0.1'
    expect(node.port).to eq 11112
  end

  describe '.left_beta_accounts' do
    it 'returns 100 users on start' do
      expect(User.left_beta_accounts).to eq 100
    end

    it 'returns max - registered users' do
      allow(User).to receive(:count).and_return(1)
      expect(User.left_beta_accounts).to eq 99
      allow(User).to receive(:count).and_return(100)
      expect(User.left_beta_accounts).to eq 0
    end

    it 'returns no negative values' do
      allow(User).to receive(:count).and_return(101)
      expect(User.left_beta_accounts).to eq 0
    end
  end

  it 'requires confirmation' do
    allow(user).to receive(:confirmed?).and_return(false)
    expect(user.send(:confirmation_required?)).to be true
  end

  describe 'as guest' do
    let(:user) { build(:user_as_guest) }

    it 'is guest' do
      expect(user).to be_guest
    end

    it 'does not validate email presence' do
      user.email = nil
      expect(user).to be_valid
    end

    it 'does not validate password presence' do
      user.password = nil
      expect(user).to be_valid
    end

    it 'requires no confirmation' do
      allow(user).to receive(:confirmed?).and_return(false)
      expect(user.send(:confirmation_required?)).to be false
    end
  end
end
