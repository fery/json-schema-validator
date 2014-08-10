module JSON
  class Schema
    class ExclusiveMinimumKeyword < Keyword
      def initialize(schema, value)
        super
        raise TypeError unless value.kind_of?(Boolean)
      end

      def validate(data)
        raise ConstrainError unless schema_has_minimum?

        true
      end

      def value
        @value
      end

      private

      def schema_has_minimum?
        schema.keywords.any? { |k| k.kind_of? MinimumKeyword }
      end
    end
  end
end