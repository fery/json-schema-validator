require 'spec_helper'

describe JSON::Schema::Validator do
  subject { JSON::Schema::Validator.new schema, data }

  context 'with valid data for the schema' do
    Fixtures.valid_schemas_and_data.each do |valid_schema, valid_data|
      context "with schema {#{valid_schema['title']}}" do
        let(:schema) { valid_schema }
        let(:data) { valid_data }

        its(:validate) { should be_true }
      end
    end
  end

  context 'with valid data for the schema' do
    Fixtures.invalid_schemas_and_data.each do |invalid_schema, invalid_data|
      context "with schema {#{invalid_schema['title']}}" do
        let(:schema) { invalid_schema }
        let(:data) { invalid_data }

        its(:validate) { should_not be_true }
      end
    end
  end
end
