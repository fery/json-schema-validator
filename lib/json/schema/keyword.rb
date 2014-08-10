module JSON
  class Schema
    class Keyword
      def initialize(schema, value)
        @value  = value
        @schema = schema
      end

      def validate(data)
        raise NotImplementedError.new('You must implement validate.')
      end

      private

      attr_reader :schema, :value
    end
  end
end