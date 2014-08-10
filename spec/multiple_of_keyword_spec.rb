require 'spec_helper'

describe JSON::Schema::MultipleOfKeyword do 
  it 'raises an exception if the passed value is not a number' do
    schema  = double('Schema')
    
    expect { JSON::Schema::MultipleOfKeyword.new(schema, 'object') }
      .to raise_error
  end

  it 'raises an exception if the passed data is not a number' do
    schema  = double('Schema')
    keyword = JSON::Schema::MultipleOfKeyword.new(schema, 5)
    data    = {}

    expect { keyword.validate(data) }.to raise_error(JSON::Schema::TypeError)
  end

  it 'does validate a multiple integer' do
    schema  = double('Schema')
    keyword = JSON::Schema::MultipleOfKeyword.new(schema, 5)
    data    = 10

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate a multiple float' do
    schema  = double('Schema')
    keyword = JSON::Schema::MultipleOfKeyword.new(schema, 0.5)
    data    = 10.0

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate an object type with anything but a hash' do
    schema  = double('Schema')
    keyword = JSON::Schema::MultipleOfKeyword.new(schema, 5)
    data    = 2.3

    expect(keyword.validate(data)).to be_falsey
  end
end