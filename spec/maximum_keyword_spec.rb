require 'spec_helper'

describe JSON::Schema::MaximumKeyword do 
  it 'raises an exception if the passed value is not a number' do
    schema = double('Schema', :is_maximum_excluding? => false)

    expect { JSON::Schema::MaximumKeyword.new(schema, 'object') }
      .to raise_error
  end

  it 'raises an exception if the passed data is not a number' do
    schema  = double('Schema', :is_maximum_excluding? => false)
    keyword = JSON::Schema::MaximumKeyword.new(schema, 5)
    data    = {}

    expect { keyword.validate(data) }.to raise_error(JSON::Schema::TypeError)
  end

  it 'does validate an integer smaller than the maximum' do
    schema  = double('Schema', :is_maximum_excluding? => false)
    keyword = JSON::Schema::MaximumKeyword.new(schema, 5)
    data    = 3

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate a float smaller than the maximum' do
    schema  = double('Schema', :is_maximum_excluding? => false)
    keyword = JSON::Schema::MaximumKeyword.new(schema, 5)
    data    = 4.9

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate a number bigger than the maximum' do
    schema  = double('Schema', :is_maximum_excluding? => false)
    keyword = JSON::Schema::MaximumKeyword.new(schema, 5)
    data    = 7

    expect(keyword.validate(data)).to be_falsey
  end

  it 'does validate a number equal to the maximum' do
    schema  = double('Schema', :is_maximum_excluding? => false)
    keyword = JSON::Schema::MaximumKeyword.new(schema, 5)
    data    = 5.0

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate a number equal to the maximum when it is excluding' do
    schema  = double('Schema', :is_maximum_excluding? => true )
    keyword = JSON::Schema::MaximumKeyword.new(schema, 5)
    data    = 5.0

    expect(keyword.validate(data)).to be_falsey
  end
end