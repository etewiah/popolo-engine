require 'spec_helper'

describe Popolo do
  describe '.storage_options' do
    context 'when using default storage options' do
      it 'should use default storage options' do
        Popolo.storage_options.should == {}
      end
    end

    context 'when using custom storage options' do
      before do
        Popolo.storage_options = {database: :test}
      end

      it 'should use custom storage options' do
        Popolo.storage_options.should == {database: :test}
      end

      after do
        Popolo.storage_options = {}
      end
    end
  end

  describe '.storage_options_per_class' do
    context 'when using default storage options' do
      it 'should use default storage options' do
        Popolo.storage_options_per_class.should == {}
      end
    end

    context 'when using custom storage options' do
      before do
        Popolo.storage_options_per_class = {
          :Membership   => {collection: 'a'},
          :Organization => {collection: 'b'},
          :Person       => {collection: 'c'},
          :Post         => {collection: 'd'},
        }
      end

      it 'should use custom storage options' do
        Popolo.storage_options_per_class.should == {
          :Membership   => {collection: 'a'},
          :Organization => {collection: 'b'},
          :Person       => {collection: 'c'},
          :Post         => {collection: 'd'},
        }
      end

      after do
        Popolo.storage_options = {}
      end
    end
  end
end
