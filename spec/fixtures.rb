class Fixtures
  class << self
    def correct_schemas_and_data
      [[correct_schema, correct_data]]
    end

    def incorrect_schemas_and_data
      []
    end

    private

    def correct_schema
      { 'name' => 'simple_schema' }
    end

    def correct_data
      []
    end
  end
end