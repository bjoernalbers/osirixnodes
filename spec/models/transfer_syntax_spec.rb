require 'rails_helper'

RSpec.describe TransferSyntax, :type => :model do
  let(:transfer_syntax) { TransferSyntax.new(value: 42, name: 'JPEG 42') }
  let(:other) { TransferSyntax.create!(value: 23, name: 'JPEG 23') }

  it 'validates value presence' do
    transfer_syntax.value = nil
    expect(transfer_syntax).to be_invalid
    expect(transfer_syntax.errors[:value]).to_not be_empty
  end

  it 'validates value presence in database' do
    transfer_syntax.value = nil
    expect { transfer_syntax.save!(validate: false) }.to raise_error
  end

  it 'validates value uniqueness' do
    transfer_syntax.value = other.value
    expect(transfer_syntax).to be_invalid
    expect(transfer_syntax.errors[:value]).to_not be_empty
  end

  it 'validates value uniqueness in database' do
    transfer_syntax.value = other.value
    expect { transfer_syntax.save!(validate: false) }.to raise_error
  end

  it 'validates name presence' do
    transfer_syntax.name = nil
    expect(transfer_syntax).to be_invalid
    expect(transfer_syntax.errors[:name]).to_not be_empty
  end

  it 'has many nodes' do
    node = create(:node, transfer_syntax: transfer_syntax)
    expect(transfer_syntax.nodes).to match [node]
  end
end
