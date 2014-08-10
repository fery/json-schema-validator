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

      def self.classify(keyword)
        class_name = keyword + 'Keyword'
        class_name.sub!(/./) { $&.upcase }

        if JSON::Schema.const_defined?(class_name)
          JSON::Schema.const_get(class_name) 
        end
      end

      private

      attr_reader :schema, :value
    end
  end
end