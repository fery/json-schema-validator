require 'spec_helper'

describe JSON::Schema::Keyword do
  class JSON::Schema::DumbKeyword < JSON::Schema::Keyword; end
  
  class JSON::Schema::DumbThingKeyword < JSON::Schema::Keyword; end

  describe '.classify' do
    it 'returns the keyword class associated to the keyword' do
      keyword = 'dumb'

      klass = JSON::Schema::Keyword.classify(keyword)

      expect(klass).to be(JSON::Schema::DumbKeyword)
    end

    it 'returns the upper cammel case class' do
      keyword = 'dumbThing'

      klass = JSON::Schema::Keyword.classify(keyword)

      expect(klass).to be(JSON::Schema::DumbThingKeyword)
    end
  end
end
