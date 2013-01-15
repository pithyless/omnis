module Omnis
  module Operators
    class NullOperator
      attr_reader :key, :value, :opts
      def initialize(key, value, opts={})
        @key, @opts = key, opts
        @value = self.class.parse_value(value)
      end

      def ==(other)
        return false unless other.is_a? self.class
        return false unless @key == other.key
        @value == other.value
      end

      def to_s
        klas = self.class.to_s.downcase.split('::')[-1]
        "#{@key.to_s} #{klas} #{@value}"
      end

      def self.parse_value(value)
        value
      end
    end

    Any = NullOperator

    class Matches < NullOperator
    end

    class Equals < NullOperator
    end

    class Gte < NullOperator
    end

    class Between < NullOperator
    end

    class BeginsWith < NullOperator
    end
  end
end
