require 'spec_helper'

module JSON
  class Schema
    describe ExclusiveMaximumKeyword do 
      it 'raises an exception if the passed value is not a boolean' do
        schema = double('Schema', :has_maximum? => false)

        expect { ExclusiveMaximumKeyword.new(schema, 'object') }
          .to raise_error(TypeError)
      end

      it 'raises an exception if the schema does not have a maximum' do
        schema  = double('Schema', :has_maximum? => false)
        keyword = ExclusiveMaximumKeyword.new(schema, true)
        
        expect { keyword.validate(10) }.to raise_error(ConstrainError)
      end

      describe '#value' do
        it 'returns the value' do
          schema  = double('Schema', :has_maximum? => true)
          keyword = ExclusiveMaximumKeyword.new(schema, true)

          expect(keyword.value).to be_truthy
        end
      end
    end
  end
end