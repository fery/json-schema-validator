require 'spec_helper'

module JSON
  class Schema
    describe ExclusiveMaximumKeyword do 
      it 'raises an exception if the passed value is not a boolean' do
        schema = double('Schema', :keywords => [] )

        expect { ExclusiveMaximumKeyword.new(schema, 'object') }
          .to raise_error(TypeError)
      end

      it 'raises an exception if the schema does not have a maximum' do
        schema  = double('Schema', :keywords => [])
        keyword = ExclusiveMaximumKeyword.new(schema, true)
        
        expect { keyword.validate(10) }.to raise_error(ConstrainError)
      end

      describe '#value' do
        it 'returns the value' do
          schema  = double('Schema')
          keyword = ExclusiveMaximumKeyword.new(schema, true)
          max_key = MaximumKeyword.new(schema, 10)

          allow(schema).to receive(:keywords).and_return [keyword, max_key]
          
          expect(keyword.value).to be_truthy
        end
      end
    end
  end
end