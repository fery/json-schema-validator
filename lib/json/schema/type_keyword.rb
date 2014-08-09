module JSON
  class Schema
    class TypeKeyword < Keyword
      TYPE_MAPPER = {
        'object' => Hash,
        'array'  => Array
      }

      def validate(data)
        data.kind_of? TYPE_MAPPER[value]
      end
    end
  end
end