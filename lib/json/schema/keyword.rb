module JSON
  class Schema
    class Keyword
      def initialize(name)
        @name = name
      end

      def validate(data)
        raise NotImplementedError.new('You must implement validate.')
      end

      private

      attr_reader :name
    end
  end
end