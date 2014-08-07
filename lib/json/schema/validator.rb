require "json/schema/validator/version"
require "json/schema/schema"

module JSON
  class Schema
    class Validator
      def initialize(schema, data)
        @schema = schema.is_a?(JSON::Schema) ? schema : JSON::Schema.new(schema)
        @data = data
      end

      def validate
        schema.validate(data)
      end

      def self.validate(schema, data)
        new(schema, data).validate

      rescue JSON::Schema::TypeError
        return false
      end

      private

      attr_accessor :schema, :data
    end
  end
end
