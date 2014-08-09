module JSON
  class Schema
    class TypeKeyword < Keyword
      TYPE_MAPPER = {
        'object'  => Hash,
        'array'   => Array,
        'integer' => Integer,
        'number'  => Numeric,
        'string'  => String,
        'null'    => NilClass
      }

      def validate(data)
        data.kind_of? TYPE_MAPPER[value]
      end
    end
  end
end