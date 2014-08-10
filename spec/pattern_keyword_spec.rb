require 'spec_helper'

describe JSON::Schema::PatternKeyword do 
  it 'raises an exception if the passed value is not a string or a regexp' do
    schema = double('Schema', :keywords => [])
    value   = 23

    expect { JSON::Schema::PatternKeyword.new(schema, value) }
      .to raise_error(JSON::Schema::TypeError)
  end

  it 'raises an exception if the passed value cant be converted to regexp' do
    schema = double('Schema', :keywords => [])
    value  = '123['

    expect { JSON::Schema::PatternKeyword.new(schema, value) }
      .to raise_error(JSON::Schema::TypeError)
  end

  it 'raises an exception if the passed data is not a string' do
    schema = double('Schema', :keywords => [])
    value  = '[0-9]{2}'
    data   = 22

    keyword = JSON::Schema::PatternKeyword.new(schema, value) 

    expect { keyword.validate(data) }.to raise_error(JSON::Schema::TypeError)
  end

  it 'validates regexp when passed correct data' do
    schema = double('Schema', :keywords => [])
    value  = '[0-9]{2}'
    data   = '22'

    keyword = JSON::Schema::PatternKeyword.new(schema, value)

    expect(keyword.validate(data)).to be_truthy
  end

  it 'does not validate regexp when passed incorrect data' do
    schema = double('Schema', :keywords => [])
    value  = '[0-9]{2}'
    data   = 'ab'

    keyword = JSON::Schema::PatternKeyword.new(schema, value)

    expect(keyword.validate(data)).to be_falsy
  end  
end