module JSON
  class Schema
    class MinimumKeyword < Keyword
      def initialize(schema, value)
        super
        raise TypeError unless value.kind_of?(Numeric)
      end

      def validate(data)
        raise TypeError unless data.kind_of?(Numeric)

        is_minimum_excluding? ? data > value : data >= value
      end

      private

      def is_minimum_excluding?
        excluding_key = schema.keywords.find do |k| 
          k.kind_of? ExclusiveMinimumKeyword
        end

        !!(excluding_key && excluding_key.value)
      end
    end
  end
end