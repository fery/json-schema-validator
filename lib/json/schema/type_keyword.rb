module JSON
  class Schema
    class TypeKeyword < Keyword
      TYPE_MAPPER = {
        'object'  => Hash,
        'array'   => Array,
        'integer' => Integer,
        'number'  => Numeric
      }

      def validate(data)
        data.kind_of? TYPE_MAPPER[value]
      end
    end
  end
end