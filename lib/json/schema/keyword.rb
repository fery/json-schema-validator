module JSON
  class Schema
    class Keyword
      def initialize(value)
        @value = value
      end

      def validate(data)
        raise NotImplementedError.new('You must implement validate.')
      end

      private

      attr_reader :value
    end
  end
end