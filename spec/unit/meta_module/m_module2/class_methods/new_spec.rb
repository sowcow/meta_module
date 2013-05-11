describe :MModule2 do
  #subject { MModule2 }
  #after { remove_const :My }

  describe '.new' do
    subject { MModule2.new(*params) }

    let(:n) { rand(1..5) }
    let(:params) { (:a..:z).take n }
    let(:instance) { subject.new *params }

    it 'returns class' do
      subject.class.should == Class
    end
    it 'result superclass is MModule' do
      subject.superclass.should == MModule
    end
    it 'instance of resulting class has attr reader for each argument given to subject.new with given values' do
      params.each { |name| instance.send(name).should == name }
    end
    it 'resulting class.new takes as many arguments as given to subject.new' do
      expect { subject.new *params }.not_to raise_error 
      expect { subject.new *params.drop(1) }.to raise_error 
      expect { subject.new *(params + [:excess]) }.to raise_error 
    end

    #it 'extends result object with self::Methods' do
    #  class My < subject
    #    module Methods
    #      def abc; 5 end
    #    end
    #  end
    #  
    #  My.new.instance_methods.should include :abc
    #end
  end
end
