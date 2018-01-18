require 'rails_helper'

RSpec.describe Node, :type => :model do
  subject { build(:node) }

  it 'has valid factory' do
    expect(subject).to be_valid
  end

  it 'validates name presence' do
    subject = build(:node, name: nil)
    expect(subject).to be_invalid
    expect(subject.errors[:name]).to_not be_empty
  end

  it 'validates address presence' do
    subject = build(:node, address: nil)
    expect(subject).to be_invalid
    expect(subject.errors[:address]).to_not be_empty
  end

  it 'validates port presence' do
    subject = build(:node, port: nil)
    expect(subject).to be_invalid
    expect(subject.errors[:port]).to_not be_empty
  end

  it 'validates aetitle presence' do
    subject = build(:node, aetitle: nil)
    expect(subject).to be_invalid
    expect(subject.errors[:aetitle]).to_not be_empty
  end

  describe '#transfer_syntax' do
    it 'defaults to 0' do
      expect(subject.transfer_syntax).to eq 0
    end
  end

  describe '#transfer_syntax_name' do
    it 'translates to human-readable format' do
      expect(subject.transfer_syntax_name).to eq 'Explicit Little Endian'
    end
  end

  describe '#retrieve_mode' do
    it 'defaults to 0' do
      expect(subject.retrieve_mode).to eq 0
    end
  end

  describe '#retrieve_mode_name' do
    it 'translates to human-readable format' do
      expect(subject.retrieve_mode_name).to eq 'C-MOVE'
    end
  end

  describe '#qr' do
    it 'defaults to true' do
      expect(subject.qr).to eq true
    end

    it 'can be false' do
      subject = build(:node, qr: false)
      expect(subject.qr).to eq false
    end

    it 'validates presence in db' do
      subject = build(:node, qr: nil)
      expect{ subject.save!(validate: false) }.
        to raise_error(ActiveRecord::ActiveRecordError)
    end
  end
end
