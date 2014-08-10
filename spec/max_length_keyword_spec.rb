require 'spec_helper'

describe JSON::Schema::MaxLengthKeyword do 
  it 'raises an exception if the passed value is not a number' do
    schema = double('Schema', :keywords => [])

    expect { JSON::Schema::MaxLengthKeyword.new(schema, 'object') }
      .to raise_error
  end

  it 'raises an exception if the passed data is not a string' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MaxLengthKeyword.new(schema, 5)
    data    = {}

    expect { keyword.validate(data) }.to raise_error(JSON::Schema::TypeError)
  end

  it 'raises an exception if the passed value is not higher than 0' do
    schema = double('Schema', :keywords => [])

    expect { JSON::Schema::MaxLengthKeyword.new(schema, -0.5) }
      .to raise_error
  end  

  it 'does validate a string length smaller than the maximum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MaxLengthKeyword.new(schema, 5)
    data    = '123'

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate a string length equal to the maximum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MaxLengthKeyword.new(schema, 5)
    data    = '12345'

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate a string greater equal to the maximum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MaxLengthKeyword.new(schema, 5)
    data    = '123456'

    expect(keyword.validate(data)).to be_falsy
  end    
end