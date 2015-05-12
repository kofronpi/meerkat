require 'spec_helper'

describe Meerkat::Request do
  it 'responds to get requests' do
    expect(described_class).to respond_to(:get)
  end

  subject { Meerkat::Request.new }

  describe "#authorization_header" do
    it 'raises MissingCredentials when api_key is not set' do
      expect { subject.send(:authorization_header, {})}  \
        .to raise_error(Meerkat::Error::MissingCredentials)
    end

    it 'sets the Authorization header when given an api_key' do
      subject.api_key = 'ab7D264efee24ef'
      expect(subject.send(:authorization_header, {})).to eq({'Authorization'=>'Bearer ab7D264efee24ef'})
    end
  end
end
