require 'spec_helper'

describe JSON::Schema::TypeKeyword do 

  it 'does validate an object type with a hash' do
    keyword = JSON::Schema::TypeKeyword.new('object')
    data    = {}

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate an object type with anything but a hash' do
    keyword = JSON::Schema::TypeKeyword.new('object')
    data    = []

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate an array type with an array' do
    keyword = JSON::Schema::TypeKeyword.new('array')
    data    = []

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate an array type with anything but an array' do
    keyword = JSON::Schema::TypeKeyword.new('array')
    data    = {}

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate an integer type with an integer' do
    keyword = JSON::Schema::TypeKeyword.new('integer')
    data    = 4

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate an integer type with a float' do
    keyword = JSON::Schema::TypeKeyword.new('integer')
    data    = 4.3

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does not validate an integer type with anything but an integer' do
    keyword = JSON::Schema::TypeKeyword.new('integer')
    data    = ''

    expect(keyword.validate(data)).to be_falsey
  end

end