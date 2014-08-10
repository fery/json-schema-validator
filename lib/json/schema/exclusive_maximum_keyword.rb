module JSON
  class Schema
    class ExclusiveMaximumKeyword < Keyword
      def initialize(schema, value)
        super
        raise TypeError unless value.kind_of?(Boolean)
      end

      def validate(data)
        raise ConstrainError unless schema_has_maximum?

        true
      end

      def value
        @value
      end

      private

      def schema_has_maximum?
        schema.keywords.any? { |k| k.kind_of? MaximumKeyword }
      end
    end
  end
end