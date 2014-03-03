module JSON
  class Schema
    class TypeError < Exception; end

    def initialize(schema)
      @schema = schema
    end

    def validate
      
    end

    private

    attr_accessor :schema
  end
end