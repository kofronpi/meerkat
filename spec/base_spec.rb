require 'spec_helper'

describe Meerkat::Base do
  describe '#initialize' do
    context 'when initialized with a hash with CamelCased keys' do
      subject do
        described_class.new(myKey: 'some value',  \
                            myNestedKey: { thingy: 'thing',  \
                                           thingyThing: 'some other thing' })
      end

      it 'should convert keys to snake_case' do
        expect(subject.my_key).to eq('some value')
        expect(subject.my_nested_key.thingy_thing).to eq('some other thing')
      end
    end
  end
end
