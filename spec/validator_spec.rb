require 'spec_helper'

describe JSON::Schema::Validator do
  let(:schema) { double(:schema, :is_a? => is_a_schema ) }
  let(:data) { 'any data' }

  let(:is_a_schema) { true }

  subject { JSON::Schema::Validator.new(schema, data) }

  context 'when the schema validates the data' do
    before { schema.stub(:validate).and_return(true) }

    its(:validate) { should be_true }
  end

  context 'when the schema does not validate the data' do
    before { schema.stub(:validate).and_raise(JSON::Schema::TypeError) }

    it 'should throw and exception' do
     lambda { subject.validates }.should raise_error
    end
  end

  context 'when the schema needs conversion' do
    let(:is_a_schema) { false }

    before do
      JSON::Schema.should_receive(:new).and_return(schema)
      schema.stub(:validate).and_return(true)
    end

    its(:validate) { should be_true }
  end

  describe ".validate" do
    subject { JSON::Schema::Validator.validate(schema, data) }

    context 'when the schema validates the data' do
      before { schema.stub(:validate).and_return(true) }

      it { should be_true }
    end

   context 'when the schema does not validate the data' do
      before { schema.stub(:validate).and_raise(JSON::Schema::TypeError) }

      it { should be_false }
    end
  end
end