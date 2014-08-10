require 'spec_helper'

module JSON
  class Schema
    describe ExclusiveMinimumKeyword do 
      it 'raises an exception if the passed value is not a boolean' do
        schema = double('Schema', :keywords => [] )

        expect { ExclusiveMinimumKeyword.new(schema, 'object') }
          .to raise_error(TypeError)
      end

      it 'raises an exception if the schema does not have a Minimum' do
        schema  = double('Schema', :keywords => [])
        keyword = ExclusiveMinimumKeyword.new(schema, true)
        
        expect { keyword.validate(10) }.to raise_error(ConstrainError)
      end

      describe '#value' do
        it 'returns the value' do
          schema  = double('Schema')
          keyword = ExclusiveMinimumKeyword.new(schema, true)
          max_key = MinimumKeyword.new(schema, 10)

          allow(schema).to receive(:keywords).and_return [keyword, max_key]
          
          expect(keyword.value).to be_truthy
        end
      end
    end
  end
end