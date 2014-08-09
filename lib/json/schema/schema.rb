module JSON
  class Schema
    class TypeError < Exception; end

    def initialize(schema)
      @schema = schema
    end

    def validate(data)
      keywords.all? { |k| k.validate(data) }
    end

    private

    def keywords
      @keywords ||= extract_keywords
    end

    def extract_keywords
      @schema.map { |k, v| classify(k).new(v) if classify(k) }.compact
    end

    def classify(keyword)
      class_name = keyword.split('_').collect!{ |w| w.capitalize }.join
      Object.const_defined?(class_name) ? Module.const_get(class_name) : false
    end

    attr_reader :schema
  end

  class SchemaKeyword
    def initialize(name)
      @name = name
    end

    def validate(data)
      raise NotImplementedError.new('You must implement validate.')
    end

    private

    attr_reader :name
  end
end