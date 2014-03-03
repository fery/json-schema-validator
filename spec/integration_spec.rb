require 'spec_helper'

describe JSON::Schema::Validator do
  subject { JSON::Schema::Validator.new schema, data }

  context 'with valid data for the schema' do
    Fixtures.correct_schemas_and_data.each do |schema, data|
      context "with schema #{schema['name']}" do
        let(:schema) { schema }
        let(:data) { data }

        it { should be_valid }
      end
    end
  end

  context 'with valid data for the schema' do
    Fixtures.incorrect_schemas_and_data.each do |schema, data|
      context "with schema #{schema['name']}" do
        let(:schema) { schema }
        let(:data) { data }

        it { should_not be_valid }
      end
    end
  end
end
