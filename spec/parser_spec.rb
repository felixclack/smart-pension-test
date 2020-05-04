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
  end
end
