class Fixtures
  class << self
    def valid_schemas_and_data
      [
        [object_schema, {}],
        [array_schema,  []],
        [integer_schema, 4],
        [number_schema,  4.5]
      ]
    end

    def invalid_schemas_and_data
      [
        [object_schema,  []],
        [array_schema,   {}],
        [integer_schema, ''],
        [number_schema,  '4']        
      ]
    end

    private

    def object_schema
      {
        'title' => 'object schema',
        'type' => 'object'
      }
    end

    def array_schema
      {
        'title' => 'array schema',
        'type' => 'array'
      }
    end

    def integer_schema
      {
        'title' => 'integer schema',
        'type' => 'integer'
      }
    end

    def number_schema
      {
        'title' => 'number schema',
        'type' => 'number'
      }
    end

  end
end