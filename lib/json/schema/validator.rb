require 'require_all'

require_all "lib/json/schema"
require_all "lib/json/schema/**/*.rb"

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

      attr_reader :schema, :data
    end
  end
end
