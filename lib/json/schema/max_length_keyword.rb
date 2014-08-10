module JSON
  class Schema
    class MaxLengthKeyword < Keyword
      def initialize(schema, value)
        super
        raise TypeError unless value.kind_of?(Numeric) && value > 0.0
      end

      def validate(data)
        raise TypeError unless data.kind_of?(String)

        data.length <= value
      end
    end
  end
end