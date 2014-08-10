require 'spec_helper'

describe JSON::Schema::MinimumKeyword do 
  it 'raises an exception if the passed value is not a number' do
    schema = double('Schema', :keywords => [])

    expect { JSON::Schema::MinimumKeyword.new(schema, 'object') }
      .to raise_error
  end

  it 'raises an exception if the passed data is not a number' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MinimumKeyword.new(schema, 5)
    data    = {}

    expect { keyword.validate(data) }.to raise_error(JSON::Schema::TypeError)
  end

  it 'does validate an integer smaller than the Minimum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MinimumKeyword.new(schema, 5)
    data    = 7

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate a float smaller than the Minimum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MinimumKeyword.new(schema, 5)
    data    = 5.1

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate a number bigger than the Minimum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MinimumKeyword.new(schema, 5)
    data    = 3

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate a number equal to the Minimum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MinimumKeyword.new(schema, 5)
    data    = 5.0

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate a number equal to the Minimum when it is excluding' do
    schema       = double('Schema')
    exlusive_key = JSON::Schema::ExclusiveMinimumKeyword.new(schema, true)
    max_key      = JSON::Schema::MinimumKeyword.new(schema, 5)
    data         = 5.0

    allow(schema).to receive(:keywords).and_return [max_key, exlusive_key]

    expect(max_key.validate(data)).to be_falsey
  end
end