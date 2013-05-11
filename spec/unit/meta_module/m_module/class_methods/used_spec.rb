describe :MModule do
  subject { MModule }

  describe '.used' do
    it 'defines extended hook with given block' do
      my = Class.new(subject) do
        used do |at|
          @used = true
        end
        attr_reader :used
      end.new
      expect { my.send :extend, my }.to change { my.used }.from(nil).to true
    end
  end
end
