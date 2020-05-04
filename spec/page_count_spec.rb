# frozen_string_literal: true

require 'spec_helper'
require_relative '../page_count'

RSpec.describe PageCount do
  describe '.new' do
    describe 'when the entries argument is not provided' do
      it 'raises an error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end

    describe 'when the entries argument is nil' do
      it 'raises an error' do
        expect { described_class.new(nil) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#all' do
    let(:entries) { ['/home 1.1.1.1', '/about 2.2.2.2'] }

    subject { described_class.new(entries).all }

    it 'returns the paths with a total count' do
      is_expected.to eq([['/home', 1], ['/about', 1]])
    end
  end
end
