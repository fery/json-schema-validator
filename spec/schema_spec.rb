require 'spec_helper'

describe JSON::Schema do
  class JSON::Schema::DumbKeyword < JSON::Schema::Keyword
    def validate(data)
      data
    end
  end

  class JSON::Schema::ReverseKeyword < JSON::Schema::Keyword
    def validate(data)
      !!!data
    end
  end

  class JSON::Schema::DumbThingKeyword < JSON::Schema::Keyword; end

  describe '#validate' do
    it 'uses keyword classes to validate data' do
      keywords   = { 'dumb' => 'dumb' }
      data       = true
      key_double = double('keyword', :validate => true)

      expect(key_double).to  receive(:validate)
      expect(JSON::Schema::DumbKeyword).to receive(:new).and_return(key_double)

      schema = JSON::Schema.new(keywords)
      schema.validate(data)
    end

    it 'uses normalizes keyword name' do
      keywords   = { 'dumbThing' => 'dumb' }

      expect(JSON::Schema::DumbThingKeyword).to receive(:new)

      schema = JSON::Schema.new(keywords)
    end

    it 'validates valid data' do
      keywords   = { 'dumb' => 'dumb' }
      valid_data = true
      schema     = JSON::Schema.new(keywords)

      expect(schema.validate(valid_data)).to be_truthy
    end

    it 'does not validates invalid data' do
      keywords     = { 'dumb' => 'dumb' }
      invalid_data = false
      schema       = JSON::Schema.new(keywords)

      expect(schema.validate(invalid_data)).to be_falsey
    end

    it 'does not validate if any of the keywords does not validate' do
      keywords = { 
        'dumb'    => 'dumb',
        'reverse' => 'reverse'
      }      
      data   = true
      schema = JSON::Schema.new(keywords)

      expect(schema.validate(data)).to be_falsey
    end
  
    describe '#has_maximum?' do
      it 'returns true if the schema has a maximum keyword' do
        keywords = { 'maximum' => 10 }

        schema = JSON::Schema.new(keywords)

        expect(schema.has_maximum?).to be_truthy
      end

      it 'returns false if the schema has not maximum keyword' do
        keywords = { 'dumb' => 10 }

        schema = JSON::Schema.new(keywords)

        expect(schema.has_maximum?).to be_falsey
      end
    end

    describe '#is_maximum_exclusive?' do
      it 'returns true if the schema has a true exclusive maximum keyword' do
        keywords = { 
          'exclusiveMaximum' => true,
          'maximum'           => 10
        }

        schema = JSON::Schema.new(keywords)

        expect(schema.is_maximum_excluding?).to be_truthy
      end

      it 'returns false if the schema does not have exluding maximum keyword' do
        keywords = { 'maximum' => 10 }

        schema = JSON::Schema.new(keywords)

        expect(schema.is_maximum_excluding?).to be_falsey
      end

      it 'returns false if the schema does not have exluding maximum keyword' do
        keywords = { 
          'exclusiveMaximum'  => false,
          'maximum'           => 10
        }

        schema = JSON::Schema.new(keywords)

        expect(schema.is_maximum_excluding?).to be_falsey
      end
    end
  end
end