require 'rails_helper'

RSpec.describe Node, :type => :model do
  let(:node) { build(:node) }

  it 'has valid factory' do
    expect(node).to be_valid
  end

  it 'belongs to user' do
    expect(node.user.class).to be User
  end

  it 'belongs to transfer syntax' do
    expect(node.transfer_syntax.class).to be TransferSyntax
  end

  it 'validates user presence' do
    node = build(:node, user: nil)
    expect(node).to be_invalid
    expect(node.errors[:user]).to_not be_empty
  end

  it 'validates user presence in database' do
    node = build(:node, user: nil)
    expect { node.save!(validate: false) }.to raise_error
  end

  it 'validates name presence' do
    node = build(:node, name: nil)
    expect(node).to be_invalid
    expect(node.errors[:name]).to_not be_empty
  end

  it 'validates address presence' do
    node = build(:node, address: nil)
    expect(node).to be_invalid
    expect(node.errors[:address]).to_not be_empty
  end

  it 'validates port presence' do
    node = build(:node, port: nil)
    expect(node).to be_invalid
    expect(node.errors[:port]).to_not be_empty
  end

  it 'validates aetitle presence' do
    node = build(:node, aetitle: nil)
    expect(node).to be_invalid
    expect(node.errors[:aetitle]).to_not be_empty
  end

  it 'validates transfer syntax presence' do
    node = build(:node, transfer_syntax: nil)
    expect(node).to be_invalid
    expect(node.errors[:transfer_syntax]).to_not be_empty
  end
end
