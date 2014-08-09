require 'spec_helper'

describe JSON::Schema::Validator do
  let(:schema) { double(:schema, :is_a? => is_a_schema, :validate => true ) }
  let(:data) { 'any data' }

  let(:is_a_schema) { true }

  subject { JSON::Schema::Validator.new(schema, data) }

  context 'when the schema validates the data' do
    its(:validate) { should be_truthy }
  end

  context 'when the schema does not validate the data' do
    it 'should throw and exception' do
      allow(schema).to receive(:validate).and_raise(JSON::Schema::TypeError)

      expect { subject.validates }.to raise_error
    end
  end

  context 'when the schema needs conversion' do
    let(:is_a_schema) { false }

    before { expect(JSON::Schema).to receive(:new).and_return(schema) }

    its(:validate) { should be_truthy }
  end

  describe '.validate' do
    subject { JSON::Schema::Validator.validate(schema, data) }

    context 'when the schema validates the data' do
      it { should be_truthy }
    end

   context 'when the schema does not validate the data' do
      before { allow(schema).to receive(:validate).and_raise(JSON::Schema::TypeError) }

      it { should be_falsey }
    end
  end
end