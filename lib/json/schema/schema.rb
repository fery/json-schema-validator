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
      @schema.select { |key, value| classify(key) && classify(key).new(value) }
    end

    def classify(keyword)
      class_name = keyword.split('_').collect!{ |w| w.capitalize }.join
      Object.const_defined?(class_name) ? Module.const_get(class_name) : false
    end

    attr_accessor :schema
  end

  class Type

  end
end