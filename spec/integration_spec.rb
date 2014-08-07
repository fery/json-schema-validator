require 'spec_helper'

describe JSON::Schema::Validator do
  subject { JSON::Schema::Validator.new schema, data }

  context 'with valid data for the schema' do
    Fixtures.valid_schemas_and_data.each do |schema, data|
      context "with schema #{schema['title']}" do
        let(:schema) { schema }
        let(:data) { data }

        it { should &:validate }
      end
    end
  end

  context 'with valid data for the schema' do
    Fixtures.invalid_schemas_and_data.each do |schema, data|
      context "with schema #{schema['title']}" do
        let(:schema) { schema }
        let(:data) { data }

        it { should_not &:validate }
      end
    end
  end
end
