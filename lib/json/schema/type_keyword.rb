module JSON
  class Schema
    class TypeKeyword < Keyword
      module ::Boolean; end
      class  ::TrueClass;  include Boolean; end
      class  ::FalseClass; include Boolean; end

      TYPE_MAPPER = {
        'object'  => Hash,
        'array'   => Array,
        'integer' => Integer,
        'number'  => Numeric,
        'string'  => String,
        'null'    => NilClass,
        'boolean' => Boolean
      }

      def validate(data)
        data.is_a? TYPE_MAPPER[value]
      end
    end
  end
end