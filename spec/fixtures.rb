class Fixtures
  class << self
    def valid_schemas_and_data
      [[simple_schema, correct_data]]
    end

    def invalid_schemas_and_data
      [[simple_schema, incorrect_data]]
    end

    private

    def simple_schema
      {
        'title' => 'simple correct schema',
        'type' => 'object'
      }
    end

    def correct_data
      {}
    end

    def incorrect_data
      []
    end
  end
end