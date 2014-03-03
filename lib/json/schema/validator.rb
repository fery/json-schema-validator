require "json/schema/validator/version"
require "json/schema/schema"

module JSON
  class Schema
    class Validator
      def initialize(schema, data)
      end

      def valid?
        true
      end

      private

      attr_accessor :schema, :data
    end
  end
end
