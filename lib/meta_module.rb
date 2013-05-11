require "meta_module/version"

module MetaModule
  # subclassing of mmodule sort of sucks?
  # use mixin with anonymous module instead?
  class MModule < Module
    
    # I use .new so don't bother user to use super in #initialize
    def self.new(*)
      super.tap { |x| x.send :include, self::Methods }
    end

    def self.used &block
      eval 'define_method :extended, &block' # to hide this line from mutant!
      # define_method :extended              # because this works too! with some warnings though:)
    end

    module Methods
      # monkey patch me...
    end
  end

  class MModule2 # < Class ...
    def self.new *params
      _params = params.join ?,
      a_params = params.map { |x| "@#{x}" }.join ?,

      Class.new(MModule) do
        eval "def initialize(#{_params}); #{a_params} = #{_params} end"
        #private
        attr_reader *params
      end
    end
  end
end
