# TODO: without .new, using Method
describe 'usage of MetaModule::' do
  after { remove_const :My, :A }

  describe 'MModule' do
    subject { MModule }

    example 'ok' do

      # definition
      class My < subject
        def initialize name
          @name = name
        end

        used do |at|
          at.abc @name
        end

        module Methods
          def abc value; @abc = value end
        end
      end

      # sort of usage
      module A
        extend RSpec::Matchers
        expect { extend My.new 1 }.to change { @abc }.from(nil).to 1
      end

      Class.new do
        extend RSpec::Matchers
        expect { extend My.new 1 }.to change { @abc }.from(nil).to 1
      end

      Object.new.instance_eval do
        extend RSpec::Matchers
        expect { extend My.new 1 }.to change { @abc }.from(nil).to 1
      end

    end
  end

  describe 'MModule2' do
    subject { MModule2 }
    example :ok do
      class My < MModule2.new :the_value
        used do |x|
          x.abc! the_value
        end

        module Methods
          def abc! value; @abc = value end
        end
      end

      Object.new.extend(My.new 100).instance_eval { @abc }.should == 100
    end
  end
end
