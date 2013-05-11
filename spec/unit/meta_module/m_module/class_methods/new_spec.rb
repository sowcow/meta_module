describe :MModule do
  subject { MModule }
  after { remove_const :My }

  describe '.new' do
    it 'extends result object with self::Methods' do
      class My < subject
        module Methods
          def abc; 5 end
        end
      end
      
      My.new.instance_methods.should include :abc
    end
  end
end