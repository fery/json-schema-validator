module JSON
  class Schema
    class MultipleOfKeyword < Keyword
      def initialize(value)
        super
        raise TypeError unless value.kind_of?(Numeric)
      end

      def validate(data)
        (data % value).zero?
      end
    end
  end
end