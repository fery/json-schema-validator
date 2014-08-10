module JSON
  class Schema
    class MaximumKeyword < Keyword
      def initialize(schema, value)
        super
        raise TypeError unless value.kind_of?(Numeric)
      end

      def validate(data)
        raise TypeError unless data.kind_of?(Numeric)

        schema.is_maximum_excluding? ? data < value : data <= value
      end
    end
  end
end