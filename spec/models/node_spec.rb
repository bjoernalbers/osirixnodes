require 'rails_helper'

RSpec.describe Node, :type => :model do
  let(:node) { build(:node) }

  it 'has valid factory' do
    expect(node).to be_valid
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

  describe '#transfer_syntax' do
    it 'defaults to 0' do
      expect(node.transfer_syntax).to eq 0
    end
  end

  describe '#transfer_syntax_name' do
    it 'translates to human-readable format' do
      expect(node.transfer_syntax_name).to eq 'Explicit Little Endian'
    end
  end

  describe '#retrieve_mode' do
    it 'defaults to 0' do
      expect(node.retrieve_mode).to eq 0
    end
  end

  describe '#retrieve_mode_name' do
    it 'translates to human-readable format' do
      expect(node.retrieve_mode_name).to eq 'C-MOVE'
    end
  end
end
