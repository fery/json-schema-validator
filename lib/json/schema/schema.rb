module JSON
  class Schema
    class TypeError      < Exception; end
    class ConstrainError < Exception; end    

    def initialize(schema)
      @title    = schema['title']
      @keywords = extract_keywords(schema)
    end

    def validate(data)
      keywords.all? { |k| k.validate(data) }
    end

    def has_maximum?
      keywords.any? { |k| k.kind_of? MaximumKeyword }
    end

    def is_maximum_excluding?
      excluding_key = find_exclusive_keyword 

      !!(excluding_key && excluding_key.value)
    end

    private

    def find_exclusive_keyword
      has_maximum? && keywords.find { |k| k.kind_of? ExclusiveMaximumKeyword }
    end

    def extract_keywords(schema)
      schema.map { |k, v| classify(k).new(self, v) if classify(k) }.compact
    end

    def classify(keyword)
      class_name = keyword + 'Keyword'
      class_name.sub!(/./) { $&.upcase }
      self.class.const_get(class_name) if self.class.const_defined?(class_name)
    end

    attr_reader :title, :keywords
  end
end