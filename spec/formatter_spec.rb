# frozen_string_literal: true

require 'spec_helper'
require_relative '../formatter'

RSpec.describe Formatter do
  describe '.new' do
    describe 'when no argument is given' do
      it 'raises an error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end

    describe 'when page_count is nil' do
      it 'raises an error' do
        expect { described_class.new(nil) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#to_s' do
    let(:page_count) { [['/about', 1], ['/home', 2]] }
    subject { described_class.new(page_count).to_s }

    it 'returns the sorted counts as a string' do
      is_expected.to eq "/home 2 visits\n/about 1 visit"
    end
  end
end
