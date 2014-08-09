require 'spec_helper'

describe JSON::Schema::TypeKeyword do 

  it 'does validate an object type with a hash' do
    keyword = JSON::Schema::TypeKeyword.new('object')
    data    = {}

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate an object type with a hash' do
    keyword = JSON::Schema::TypeKeyword.new('object')
    data    = []

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate an array type with an array' do
    keyword = JSON::Schema::TypeKeyword.new('array')
    data    = []

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate an array type with an array' do
    keyword = JSON::Schema::TypeKeyword.new('array')
    data    = {}

    expect(keyword.validate(data)).to be_falsey
  end

end