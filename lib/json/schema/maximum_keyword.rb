module JSON
  class Schema
    class MaximumKeyword < Keyword
      def initialize(value)
        super
        raise TypeError unless value.kind_of?(Numeric)
      end

      def validate(data)
        raise TypeError unless data.kind_of?(Numeric)

        data < value
      end
    end
  end
end