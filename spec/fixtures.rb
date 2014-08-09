class Fixtures
  class << self
    def valid_schemas_and_data
      [
        [object_schema, {}],
        [array_schema,  []]
      ]
    end

    def invalid_schemas_and_data
      [
        [object_schema, []],
        [array_schema,  {}]
      ]
    end

    private

    def object_schema
      {
        'title' => 'simple object schema',
        'type' => 'object'
      }
    end

    def array_schema
      {
        'title' => 'simple array schema',
        'type' => 'array'
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