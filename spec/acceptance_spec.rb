require 'spec_helper'

describe JSON::Schema::Validator do
  context 'with valid data for the schema' do
    Fixtures.valid_schemas_and_data.each do |valid_schema, valid_data|
      context "with schema {#{valid_schema['title']}}" do
        it 'validates valid schema with valid data' do 
          schema = JSON::Schema::Validator.new valid_schema, valid_data
          
          expect(schema.validate).to be_truthy 
        end
      end
    end
  end

  context 'with valid data for the schema' do
    Fixtures.invalid_schemas_and_data.each do |invalid_schema, invalid_data|
      context "with schema {#{invalid_schema['title']}}" do
        it "validates valid schema with invalid data {#{invalid_data}}" do 
          schema = JSON::Schema::Validator.new invalid_schema, invalid_data
          
          expect(schema.validate).to be_falsey
        end
      end
    end
  end
end
