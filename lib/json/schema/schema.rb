module JSON
  class Schema
    class TypeError < Exception; end

    def initialize(schema)
      @title    = schema['title']
      @keywords = extract_keywords(schema)
    end

    def validate(data)
      keywords.all? { |k| k.validate(data) }
    end

    private

    def extract_keywords(schema)
      schema.map { |k, v| classify(k).new(v) if classify(k) }.compact
    end

    def classify(keyword)
      class_name = keyword + 'Keyword'
      class_name.sub!(/./) { $&.upcase }
      self.class.const_get(class_name) if self.class.const_defined?(class_name)
    end

    attr_reader :title, :keywords
  end
end