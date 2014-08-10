module JSON
  class Schema
    class ExclusiveMaximumKeyword < Keyword
      def initialize(schema, value)
        super
        raise TypeError unless value.kind_of?(Boolean)
      end

      def validate(data)
        raise ConstrainError unless schema.has_maximum?

        true
      end

      def value
        @value
      end
    end
  end
end