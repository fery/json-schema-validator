require 'spec_helper'

describe JSON::Schema do
  class DumbKeyword < JSON::SchemaKeyword
    def validate(data)
      data
    end
  end

  class ReverseKeyword < JSON::SchemaKeyword
    def validate(data)
      !!!data
    end
  end

  describe '#validate' do
    it 'uses keyword classes to validate data' do
      keywords   = { 'dumb_keyword' => 'dumb' }
      data       = true
      schema     = JSON::Schema.new(keywords)
      key_double = double('keyword', :validate => true)

      expect(key_double).to  receive(:validate)
      expect(DumbKeyword).to receive(:new).and_return(key_double)

      schema.validate(data)
    end

    it 'validates valid data' do
      keywords   = { 'dumb_keyword' => 'dumb' }
      valid_data = true
      schema     = JSON::Schema.new(keywords)

      expect(schema.validate(valid_data)).to be_truthy
    end

    it 'does not validates invalid data' do
      keywords     = { 'dumb_keyword' => 'dumb' }
      invalid_data = false
      schema       = JSON::Schema.new(keywords)

      expect(schema.validate(invalid_data)).to be_falsey
    end

    it 'does not validate if any of the keywords does not validate' do
      keywords = { 
        'dumb_keyword'    => 'dumb',
        'reverse_keyword' => 'reverse'
      }      
      data   = true
      schema = JSON::Schema.new(keywords)

      expect(schema.validate(data)).to be_falsey
    end
  end
end