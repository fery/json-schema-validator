require 'spec_helper'

describe JSON::Schema::MultipleOfKeyword do 
  it 'raises an exception if the passed value is not a number' do
    expect { JSON::Schema::MultipleOfKeyword.new('object') }.to raise_error
  end

  it 'does validate a multiple integer' do
    keyword = JSON::Schema::MultipleOfKeyword.new(5)
    data    = {}

    expect(keyword.validate(10)).to be_truthy
  end

  it 'does validate a multiple float' do
    keyword = JSON::Schema::MultipleOfKeyword.new(0.5)
    data    = {}

    expect(keyword.validate(10.0)).to be_truthy
  end

  it 'does not validate an object type with anything but a hash' do
    keyword = JSON::Schema::MultipleOfKeyword.new(5)
    data    = 2.3

    expect(keyword.validate(data)).to be_falsey
  end
end