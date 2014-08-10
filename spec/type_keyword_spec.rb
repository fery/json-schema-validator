require 'spec_helper'

describe JSON::Schema::TypeKeyword do 
  it 'does validate an object type with a hash' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'object')
    data    = {}

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate an object type with anything but a hash' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'object')
    data    = []

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate an array type with an array' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'array')
    data    = []

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate an array type with anything but an array' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'array')
    data    = {}

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate an integer type with an integer' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'integer')
    data    = 4

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate an integer type with a float' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'integer')
    data    = 4.3

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does not validate an integer type with anything but an integer' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'integer')
    data    = ''

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate a number type with an number' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'number')
    data    = 4

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate a number type with a float' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'number')
    data    = 4.3

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate a number type with anything but an number' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'number')
    data    = ''

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate a string type with a float' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'string')
    data    = '4.3'

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate a string type with anything but an string' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'string')
    data    = 4.3

    expect(keyword.validate(data)).to be_falsey
  end
  
  it 'does validate a null type with a float' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'null')
    data    = nil

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate a null type with anything but an null' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'null')
    data    = 4.3

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate a boolean type with true' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'boolean')
    data    = true

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate a boolean type with false' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'boolean')
    data    = false

    expect(keyword.validate(data)).to be_truthy
  end  

  it 'does not validate a boolean type with anything but an boolean' do
    schema  = double('Schema')
    keyword = JSON::Schema::TypeKeyword.new(schema, 'boolean')
    data    = 4.3

    expect(keyword.validate(data)).to be_falsey
  end  
end