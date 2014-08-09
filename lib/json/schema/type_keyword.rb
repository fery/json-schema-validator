module JSON
  class Schema
    class TypeKeyword < Keyword
      def validate(data)
        data.kind_of? Hash
      end
    end
  end
end