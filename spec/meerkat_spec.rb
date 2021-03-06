require 'spec_helper'

describe Meerkat do
  after { Meerkat.reset }
  it 'has a version number' do
    expect(Meerkat::VERSION).not_to be nil
  end

  describe '.client' do
    it 'is a Meerkat::Client' do
      expect(Meerkat.client).to be_a Meerkat::Client
    end

    it 'does not override other clients' do
      cl1 = Meerkat.client(endpoint: 'http://endpoint.api.com')
      cl2 = Meerkat.client(endpoint: 'http://api.endpoint.com')
      expect(cl1.endpoint).to eq('http://endpoint.api.com')
      expect(cl2.endpoint).to eq('http://api.endpoint.com')
    end
  end

  describe '.api_key=' do
    it 'sets the API key' do
      Meerkat.api_key = 'mysecret'
      expect(Meerkat.api_key).to eq 'mysecret'
    end
  end

  describe '.configure' do
    Meerkat::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "sets the given #{key}" do
        Meerkat.configure do |config|
          config.send("#{key}=", key)
          expect(Meerkat.send(key)).to eq(key)
        end
      end
    end
  end
end
