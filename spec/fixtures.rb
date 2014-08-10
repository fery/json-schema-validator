class Fixtures
  class << self
    def valid_schemas_and_data
      [
        [object_schema, {}  ],
        [array_schema,  []  ],
        [integer_schema, 20 ],
        [number_schema,  4.5],
        [string_schema,  'a'],
        [null_schema,    nil],
        [boolean_schema, true],
      ]
    end

    def invalid_schemas_and_data
      [
        [object_schema,  [] ],
        [array_schema,   {} ],
        [integer_schema, '' ],
        [number_schema,  '4'],
        [string_schema,  5  ],
        [null_schema,    'a'],
        [boolean_schema, nil],
        [integer_schema, 19 ]
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
        'title'      => 'integer schema',
        'type'       => 'integer',
        'multipleOf' => 5
      }
    end

    def number_schema
      {
        'title' => 'number schema',
        'type' => 'number'
      }
    end

    def string_schema
      {
        'title' => 'string schema',
        'type' => 'string'
      }
    end
    
    def null_schema
      {
        'title' => 'null schema',
        'type' => 'null'
      }
    end

    def boolean_schema
      {
        'title' => 'boolean schema',
        'type' => 'boolean'
      }
    end    
  end
end