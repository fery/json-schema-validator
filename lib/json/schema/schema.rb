module JSON
  class Schema
    class TypeError      < Exception; end
    class ConstrainError < Exception; end    

    attr_reader :keywords

    def initialize(schema)
      @title    = schema['title']
      @keywords = extract_keywords(schema)
    end

    def validate(data)
      keywords.all? { |k| k.validate(data) }
    end

    private

    def extract_keywords(schema)
      schema.map do |k, v| 
        Keyword.classify(k).new(self, v) if Keyword.classify(k)
      end.compact
    end

    attr_reader :title
  end
end