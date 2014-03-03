require 'spec_helper'

describe JSON::Schema::Validator do
  let(:schema) { double(:schema) }
  let(:data) { 'any data' }

  subject { JSON::Schema::Validator.new(schema, data) }

  context 'when the schema validates the data' do
    before { schema.stub(:validates).and_return(true) }

    its(:validate) { should be_true }
  end

  context 'when the schema does not validate the data' do
    before { schema.stub(:validates).and_raise(JSON::Schema::TypeError) }

    it 'should throw and exception' do
     lambda { subject.validates }.should raise_error
    end
  end

  describe ".validate" do
    subject { JSON::Schema::Validator.validate(schema, data) }

    context 'when the schema validates the data' do
      before { schema.stub(:validates).and_return(true) }

      it { should be_true }
    end

   context 'when the schema does not validate the data' do
      before { schema.stub(:validates).and_raise(JSON::Schema::TypeError) }

      it { should be_false }
    end
  end
end