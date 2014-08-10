module JSON
  class Schema
    class PatternKeyword < Keyword
      def initialize(schema, value)
        super

        unless [String, Regexp].include? value.class
          raise TypeError.new("Pattern: has to be a string or a regexp")
        end

        @value = Regexp.new(@value)

      rescue RegexpError => e
        raise TypeError.new("Pattern #{value}: is not a valid Regexp")
      end

      def validate(data)
        unless data.kind_of? String
          raise TypeError.new("Pattern data needs to be string") 
        end
        
        !!@value.match(data)
      end
    end
  end
end