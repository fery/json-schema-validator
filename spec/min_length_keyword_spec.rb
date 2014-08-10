require 'spec_helper'

describe JSON::Schema::MinLengthKeyword do 
  it 'raises an exception if the passed value is not a number' do
    schema = double('Schema', :keywords => [])

    expect { JSON::Schema::MinLengthKeyword.new(schema, 'object') }
      .to raise_error
  end

  it 'raises an exception if the passed data is not a string' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MinLengthKeyword.new(schema, 5)
    data    = {}

    expect { keyword.validate(data) }.to raise_error(JSON::Schema::TypeError)
  end

  it 'raises an exception if the passed value is not higher or equal to 0' do
    schema = double('Schema', :keywords => [])

    expect { JSON::Schema::MinLengthKeyword.new(schema, -0.5) }
      .to raise_error
  end  

  it 'does validate a string length smaller than the Minimum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MinLengthKeyword.new(schema, 2)
    data    = '123'

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does validate a string length equal to the Minimum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MinLengthKeyword.new(schema, 0)
    data    = ''

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate a string greater equal to the Minimum' do
    schema  = double('Schema', :keywords => [])
    keyword = JSON::Schema::MinLengthKeyword.new(schema, 9)
    data    = '123456'

    expect(keyword.validate(data)).to be_falsy
  end    
end