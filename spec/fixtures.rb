class Fixtures
  class << self
    def valid_schemas_and_data
      [
        [object_schema,  {} ],
        [array_schema,   [] ],
        [integer_schema, 20 ],
        [number_schema,  4.5],
        [string_schema,  '123'],
        [null_schema,    nil],
        [boolean_schema, true]
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
        [integer_schema, 19 ],
        [number_schema,  102],
        [number_schema,  100],
        [integer_schema, 10 ],
        [string_schema,  '123456'],
        [string_schema,  '1'],
        [string_schema,  '1a3'],
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
        'title'            => 'integer schema',
        'type'             => 'integer',
        'multipleOf'       => 5,
        'minimum'          => 10,
        'exclusiveMinimum' => true
      }
    end

    def number_schema
      {
        'title'            => 'number schema',
        'type'             => 'number',
        'maximum'          =>  100,
        'exclusiveMaximum' =>  true
      }
    end

    def string_schema
      {
        'title'     => 'string schema',
        'type'      => 'string',
        'maxLength' => 5,
        'minLength' => 2,
        'pattern'   => '[0-9]{3}'
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