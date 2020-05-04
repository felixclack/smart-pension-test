# frozen_string_literal: true

require 'spec_helper'
require_relative '../parser'

RSpec.describe Parser do
  describe '.new' do
    describe 'without a file argument' do
      it 'raises an error' do
        expect { described_class.new }
          .to raise_error(ArgumentError)
      end
    end

    describe 'when the provided file is nil' do
      it 'raises an error' do
        expect { described_class.new(nil) }
          .to raise_error(ArgumentError, 'a log file must be provided')
      end
    end

    describe 'when the File is non-existent' do
      before do
        allow(File).to receive(:exist?).and_return(false)
      end

      it 'raises an error' do
        expect { described_class.new('no.log') }
          .to raise_error(ArgumentError, 'that file does not exist')
      end
    end
  end

  describe '#run' do
    subject { described_class.new(filename).run }

    describe 'with an empty log' do
      let(:filename) { 'spec/fixtures/empty.log' }

      it { is_expected.to eq 'No Results' }
    end

    describe 'with multiple valid log entries' do
      let(:filename) { 'spec/fixtures/count.log' }

      it { is_expected.to eq "total\n/home 2 visits\n/about 1 visit\nunique\n/about 1 visit\n/home 1 visit" }
    end
  end
end
